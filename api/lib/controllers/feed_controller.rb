require 'sinatra'
require 'json'

require_relative '../auroragram'

class Auroragram::Controllers::FeedController < Auroragram::Controllers::JsonBaseController

  get '/api/v1/feed/?' do

    file = open('../instagram-northern-lights.json')
    json = file.read

    json_data = JSON.parse(json)

    posts = []

    json_data['data'].each do |post|
      if post['location'] != nil
        puts post['link']
        puts "\t#{post['location']}"
        puts "#{post['location']['latitude']}, #{post['location']['longitude']}"

        posts << {
          :link => post['link'],
          :gmapsLocation => "#{post['location']['latitude']}, #{post['location']['longitude']}",
          :images => post['images']
        }
      end
    end

    posts.to_json

  end

end
