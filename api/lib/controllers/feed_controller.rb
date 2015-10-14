require 'sinatra'
require 'json'

require_relative '../auroragram'

class Auroragram::Controllers::FeedController < Auroragram::Controllers::JsonBaseController

  def format_image(image)
    {
      :type => image.type,
      :url => image.url,
      :width => image.width,
      :height => image.height
    }
  end

  def format_images(post)
    images = { :standard_resolution => nil , :low_resolution => nil, :thumbnail => nil }

    post.images.each do |image|
      if image.type == "low_resolution"
        images[:low_resolution] = format_image(image)
      elsif image.type == "standard_resolution"
        images[:standard_resolution] = format_image(image)
      elsif image.type == "thumbnail"
        images[:thumbnail] = format_image(image)
      end
    end

    images
  end

  def format_output(post)
    {
      :id => post.id,
      :igId => post.ig_id,
      :link => post.link,
      :location => post.location,
      :country => post.country,
      :countryCode => post.country_code,
      :images => format_images(post),
      :user => {
        :username => post.user.username
      }
    }
  end

  get '/api/v1/feed/?' do
    posts = Post.where(:created_at.gte => 3.days.ago).sort(:created_at.desc)

    results = posts.map do |post|
      format_output(post)
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
