require 'active_support'
require 'sinatra'

require './lib/auroragram'

class App < Sinatra::Application

	# mount controllers (which are actually middleware as well)
	use Auroragram::Controllers::FeedController

end