require "httparty"
require "json"
# require_relative "create_game"

def create_player(x)
	player=Player.find_by(pname: x)
	if player.nil?
		check_player=HTTParty.get("https://lichess.org/api/user/#{x}").code
	  	if check_player==200
			liplayer=JSON.parse(HTTParty.get("https://www.lichess.org/api/user/#{x}").body)
			brating=(liplayer['perfs']['bullet']['rating'].to_i+liplayer['perfs']['blitz']['rating'].to_i)/2
			player=Player.new(pname: x, 
			  BRating: brating, SRating: liplayer['perfs']['classical']['rating'])
			if !liplayer['profile'].nil?
			  player.country=liplayer['profile']['country']  
			end
			player.save
		    if !player.save
		    	return nil
		    end
		    return player
		else 
			puts "Player not found on Lichess or something's wrong. Please try again later."
			return nil
		end
	end
	return player
end

def create_game(game,gameId,gt_id,white_id,black_id)
	cgame=Game.find_by(gid: gameId)
	if cgame.present?
		return cgame
	end	
	winner=game["winner"]
	if winner=="black"
		winner_id=black_id
	elsif winner=="white"
		winner_id=white_id
	else
		winner_id=nil
	end
	puts winner_id

	wr=game["players"]["white"]["rating"]
	br=game["players"]["black"]["rating"]

	puts "Working inside"
	game=Game.new(gid: gameId, white_id: white_id, black_id: black_id, winner_id: winner_id,white_rating: wr,black_rating: br,gametype_id: gt_id)
	if !game.save!
		puts "Fault exists"
		return nil
	else 
		puts "Working"
		return game
	end
	
end

# Tournament.all.each { |tour|
# 	tid=tour.tid
# 	gt_id=tour.gametype.id
# 	link=HTTParty.get("https://lichess.org/api/tournament/#{tid}")
# 	if link.code==200
# 		link=JSON.parse(link.body)
# 		puts "**********************"
# 		puts link["pairings"].length
# 		puts "**********************"
		
# 		link["pairings"].each{ |pair|
# 			gameId=pair["id"]			
# 			game=HTTParty.get("https://lichess.org/api/game/#{gameId}")
# 			if game.code==200
# 				game=JSON.parse(game.body)
# 				white=game["players"]["white"]["userId"]
# 				white_player=create_player(white)
# 				black=game["players"]["black"]["userId"]
# 				black_player=create_player(black)
# 				if white_player.present? && black_player.present?
# 					game=create_game(game,gameId,gt_id,white_player.id,black_player.id)
# 					tour_game=tour.tournament_games.build(tid: tid,gid: gameId,game_id: game.id)
# 					tour_game.save
# 				end

# 			end

# 		}
# 	end

#  }