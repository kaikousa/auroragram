require 'sinatra'

# Base-class for controllers that accept and server JSON.
# Parses the request body to JSON and sets the correct headers.
# @author: Kai Kousa
class Auroragram::Controllers::JsonBaseController < Sinatra::Application

	before do
	  content_type :json, :charset => 'utf-8'

	  request.body.rewind
	  body = request.body.read

	  if body.length > 0
	  	begin
		  	@request_payload = JSON.parse body
		rescue
			# TODO hand properly and send an error
			@request_payload = {}
		end
	  else
	  	@request_payload = {}
	  end

	end

end
