require "httparty"
require "json"
# require_relative "development/create_tournamentgames"
Tournament.all.each { |tour|
	puts "Inside"
	tid=tour.tid
	content=JSON.parse(HTTParty.get("https://lichess.org/api/tournament/#{tid}").body)
	# puts content

	if content["standing"]["players"][0]["rank"]==1
		player_id=Player.find_by(pname: content["standing"]["players"][0]["name"])
		if player_id.nil?
			player_id=create_player(content["standing"]["players"][0]["name"])
		end
		player_id=player_id.id
		tour.first_id=player_id
		tour.first_score=content["standing"]["players"][0]["score"]
		puts "1 done"
	end
	if content["standing"]["players"][1]["rank"]==2
		player_id2=Player.find_by(pname: content["standing"]["players"][1]["name"])
		if player_id2.nil?
			player_id2=create_player(content["standing"]["players"][1]["name"])
		end
		player_id2=player_id2.id
		tour.second_id=player_id2
		tour.second_score=content["standing"]["players"][1]["score"]
	end
	if content["standing"]["players"][2]["rank"]==3
		player_id3=Player.find_by(pname: content["standing"]["players"][2]["name"])
		if player_id3.nil?
			player_id3=create_player(content["standing"]["players"][2]["name"])
		end
		player_id3=player_id3.id
		tour.third_id=player_id3
		tour.third_score=content["standing"]["players"][2]["score"]
	end
	tour.save!
}