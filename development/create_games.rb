require_relative './../lib/pgn_parser'
y=[]
Dir.glob('./development/PGNs/*.pgn') do |file|
	x=PgnParser.new(File.read(file))
	 x=x.parse.to_json
	 y<<JSON.parse(x)
	end
# byebug
i=1
j=1
y.each { |pgn|
	gid=pgn['Site'].split("/")[3]
	white=pgn['White']
	white_id=Player.find_by(pname:white).id
	black=pgn['Black']
	black_id=Player.find_by(pname:black).id
	if pgn['Result'].length==3
		if pgn['Result'][0]=="1"
			winner=pgn['White']
		else
			winner=pgn['Black']
		end
		winner_id=Player.find_by(pname: winner).id
		puts winner_id
	else
		winner=nil
	end
	gt=pgn['Event']
	if gt.include?("Bullet")
		gt_id=Gametype.find_by(name: "Bullet").id
		wr=pgn['WhiteElo']
		br=pgn['BlackElo']

		puts "Working inside"
		x=Game.new(gid: gid, white_id: white_id, black_id: black_id, winner_id: winner_id,white_rating: wr,black_rating: br,gametype_id: gt_id)
		if !x.save!
			puts "Fault exists"
			j=j+1
			puts "Not working #{j}:#{gid}"
		else 
			puts "Working #{i}"
			i=i+1
		end
	end

}
