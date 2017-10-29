namespace :create do
  desc "Create players"
  task players: :environment do
  	load "./development/create_players.rb"
  end

  desc "Create games"
  task games: :environment do
  	load "./development/create_games.rb"
  end

end
