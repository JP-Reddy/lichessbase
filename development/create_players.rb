require_relative './../lib/pgn_parser'
require 'httparty'
y=[]
Dir.glob('./development/PGNs/*.pgn') do |file|
	x=PgnParser.new(File.read(file))
	 x=x.parse.to_json
	 y<<JSON.parse(x)
end
puts y.length
# sleep(10)
names=[]

y.each { |game|
	if !names.include?(game['White'])
		names<<game['White']
	end
	if !names.include?(game['Black'])
		names<<game['Black']
	end
}
puts names.length
# sleep(10)

player=[]
names.each { |x|
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
		    	next
		    end
		end
	end
}