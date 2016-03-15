require 'json'

file = open('instagram-northern-lights.json')
json = file.read

json_data = JSON.parse(json)

json_data['data'].each do |post| 
	if post['location'] != nil
		puts post['link']
		puts "\t#{post['location']}"
		puts "#{post['location']['latitude']}, #{post['location']['longitude']}"
	end
end