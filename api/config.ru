require './app'
require 'bundler'

Bundler.require

config = YAML.load(File.read('config/settings.yaml'))

set :logging, :true

MongoMapper.setup({
	'production' => {
		'uri' => "mongodb://#{config['mongodb']['server']}/#{config['mongodb']['db']}" }
		},
		'production')

run App.new
