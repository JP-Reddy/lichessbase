require 'httparty'
require 'json'
list=Tournament.all
puts "Got"
list.each { |tour|
	puts "Entered"
	tid=tour.tid
	puts tid
	content=HTTParty.get("https://lichess.org/api/tournament/#{tid}")
	if content.code==200
		puts "OK"
		content=JSON.parse(content.body)
		puts "Done"
		tour.start=content["startsAt"]
		puts tour.start
		puts "Started"
		tour.end=content["finishesAt"]
		puts "Finished"
		tour.save
	end
}