require 'rest-client'

# A tiny client for Google's Geocoding API.
class Auroragram::Utils::GeocodingClient

  def self.get_location(latitude, longitude)
    api_key = ENV['GOOGLE_GEOCODING_API_KEY']
    # https://developers.google.com/maps/documentation/geocoding/#ReverseGeocoding
    url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=#{ latitude },#{ longitude }&key=#{ api_key }"

    response = RestClient.get(url)

    json = JSON.parse(response.to_str)
  end

  def self.get_country(latitude, longitude)
    country = nil

    result = self.get_location(latitude, longitude)
      if result['results'].count > 1
      result['results'][0]['address_components'].each do |component|

        if component['types'].include?('country')
          country = component
        end

      end
    end

    country
  end

end
