require 'sinatra'
require 'json'

require_relative '../auroragram'

class Auroragram::Controllers::FeedController < Auroragram::Controllers::JsonBaseController

  get '/api/v1/feed/?' do
    posts = Post.where(:created_at.gte => 3.days.ago).sort(:created_at.desc)

    results = posts.map do |post|
      Auroragram::Utils::FeedRenderer.format_output(post)
    end

    results.to_json

  end

  get '/api/v1/feed/countries/?' do
    posts = Post.where(:created_at.gte => 3.days.ago).sort(:country.desc)

    countries = Hash.new

    posts.each do |post|
      if countries.include?(post.country)
        #increment
        countries[post.country] += 1
      else
        #create
        countries[post.country] = 1
      end
    end

    results = []
    countries.each do |country, count|
      results << {:country=>country, :count => count}
    end
    results.sort! {|a,b| a[:count] <=> b[:count] }
    results.reverse!

    results.to_json
  end

end
