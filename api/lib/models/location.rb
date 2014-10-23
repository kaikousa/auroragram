require 'mongo_mapper'

class Location
    include MongoMapper::EmbeddedDocument

    key :latitude, String, :default => ''
    key :longitude, String, :default => ''

end
