require 'rest-client'

class Auroragram::Utils::GeocodingClient

  def self.get_location(latitude, longitude)
    api_key = 'AIzaSyC2gMcM3VB_PMetJsr6mfC6BR7FAnZlA2Y'
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
