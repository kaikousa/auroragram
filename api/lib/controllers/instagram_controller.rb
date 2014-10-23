require 'sinatra'
require 'json'
require 'instagram'

require_relative '../auroragram'

class Auroragram::Controllers::InstagramController < Auroragram::Controllers::JsonBaseController

  CALLBACK_URL = "http://auroragram.com/api/v1/instagram/oauth/callback"

  Instagram.configure do |config|
    config.client_id = ENV['INSTAGRAM_CLIENT_ID']
    config.client_secret = ENV['INSTAGRAM_CLIENT_SECRET']
  end

  get '/api/v1/instagram/oauth/connect' do
    redirect Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
  end

  get '/api/v1/instagram/oauth/callback' do
    response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)

    content_type :html, :charset => 'utf-8'
    response.access_token
  end

  # Instagram uses this to verify the subscription (http://instagram.com/developer/realtime/)
  # To verify, we send back the challenge
  get '/api/v1/instagram/?' do
    content_type :html, :charset => 'utf-8'

    params['hub.challenge']
  end

  # new events are posted here
  post '/api/v1/instagram/?' do
    p @request_payload

    @request_payload.each do |changed_tag|
      puts "checking new media for tag #{changed_tag['object_id']}"

      client = Instagram.client(:access_token => ENV['INSTAGRAM_ACCESS_TOKEN'])
      for media_item in client.tag_recent_media(changed_tag['object_id'])
        puts media_item['id']
        puts "#{media_item.images.thumbnail.url}"

        Auroragram::Services::PostService.create(media_item)
      end

    end
    content_type :html, :charset => 'utf-8'
    "hello"
  end

end
