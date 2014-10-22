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

        posts << {
          :id => post['id'],
          :link => post['link'],
          :gmapsLocation => "#{post['location']['latitude']}, #{post['location']['longitude']}",
          :location => post['location'],
          :images => post['images']
        }
      end
    end

    posts.to_json

  end

end
