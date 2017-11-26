list=Tournament.all.each {
	|x|
	tid=x.tid
	tour=JSON.parse(HTTParty.get("https://lichess.org/api/tournament/#{tid}").body)
	if tour["createdBy"]!="lichess"
		puts tour["createdBy"]
		x.delete
	end
}

