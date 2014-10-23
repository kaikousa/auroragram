require 'mongo_mapper'

class Image
    include MongoMapper::EmbeddedDocument

    key :type, String, :default => ''
    key :url, String, :default => ''
    key :width, String, :default => ''
    key :height, String, :default => ''

end
