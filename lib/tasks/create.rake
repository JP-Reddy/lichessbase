namespace :create do
  desc "Create players"
  task players: :environment do
  	load "./development/create_players.rb"
  end

  desc "Create games"
  task games: :environment do
  	load "./development/create_games.rb"
  end

  desc "Create gametpyes"
  task gametpyes: :environment do 
  	Gametype.create(name: "Blitz")
  	Gametype.create(name: "Bullet")
  	Gametype.create(name: "Classical")
  end

end
