require 'mongo_mapper'

class User
    include MongoMapper::EmbeddedDocument

    key :username, String, :default => ''
    key :website, String, :default => ''
    key :profile_picture, String, :default => ''
    key :full_name, String, :default => ''
    key :bio, String, :default => ''
    key :ig_user_id, String, :default => ''

end
