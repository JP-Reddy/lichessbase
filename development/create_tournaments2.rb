require 'httparty'

tour=HTTParty.get('https://lichess.org/api/tournament')
if(tour.code==200)
	tour=JSON.parse(tour.body)
	tour.
end