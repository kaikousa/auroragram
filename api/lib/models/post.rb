require 'mongo_mapper'

class Post
    include MongoMapper::Document

    key :ig_id, String, :default => ''
    key :link, String, :default => ''
    key :created_at, Time

    one :location

    key :country, String, :default => ''
    key :country_code, String, :default => ''

    one :user

    many :images

end
