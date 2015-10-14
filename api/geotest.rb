require 'yaml'

require_relative './lib/auroragram'

config = YAML.load(File.read('config/settings.yaml'))

MongoMapper.setup({
  'production' => {
    'uri' => "mongodb://#{config['mongodb']['server']}/#{config['mongodb']['db']}" }
    },
    'production')

Post.all().each do |post|

  country = Auroragram::Utils::GeocodingClient.get_country(post.location.latitude, post.location.longitude)

  if country != nil
    puts country['long_name']

    post.country = country['long_name']
    post.country_code = country['short_name']

    post.save!
  end

end
