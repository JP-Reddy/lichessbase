# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
# y=[]
# Dir.glob('./development/PGNs/*.pgn') do |file|
# 	x=PgnParser.new(File.read(file))
# 	 x=x.parse.to_json
# 	 y<<JSON.parse(x)
# 	end

# y.each { |pgn|
# 	gid=pgn['Site'].split("/")[3]
# 	white=pgn['White']
# 	black=pgn['Black']
# 	if pgn['Result'].length==3
# 		if pgn['Result'][0]=="1"
# 			winner=pgn['White']
# 		else
# 			winner=pgn['Black']
# 		end
# 	else
# 		winner=""
# 	end
# 	gt=pgn['Variant']
# 	gt_id=Game.find_by(name: gt)[:id]
# 	wr=pgn['WhiteElo']
# 	br=pgn['BlackElo']
# 	x=Game.new(gid: gid, white: white, black: black, winner: winner,white_rating: wr,black_rating: br,gt_id: gt_id)
# 	if !x.save?
# 		next
# 	end
# }


# a=Gametype.new(name:"Blitz")
# a.description='Time controls for each player in a game of blitz chess are, according to FIDE, 10 minute
# s or less per player. Can be "sudden death", with no time increment per move; but may also be played with a small increm
# ent per move, a more recent development due to the influx of digital clocks. Three minutes with a two-second increment i
# s preferred. In the case of time increments, the total time per player for a 60 move game must be 10 minutes or less'
# a.save

# a=Gametype.new(name:"Bullet")
# a.description="A variant of blitz chess, bullet chess games have less than three minutes per player, based on a 40 move game; although one minute per player chess can be excluded. Common time controls for this setting is 2 minutes with one-second increment or 1 minute with a two-second increment. The term lightning can also be applied to this variant."
# a.save

# a=Gametype.new(name: "Classical")
# a.save
