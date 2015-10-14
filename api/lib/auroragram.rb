module Auroragram

	module Controllers

    require_relative './controllers/json_base_controller'
  	require_relative './controllers/feed_controller'
    require_relative './controllers/instagram_controller'

	end

  module Models

    require_relative './models/image'
    require_relative './models/location'
    require_relative './models/post'
    require_relative './models/user'

  end

  module Services

    require_relative './services/post_service'

  end

  module Utils

    require_relative './utils/geocoding_client'

  end

end
