#load "./development/create_tournaments.rb"
# byebug
require 'httparty'
require 'json'
content=HTTParty.get("https://lichess.org/api/tournament")
if content.code==200
	a=JSON.parse(content.body)
end
a=a["finished"]
a.each{|x| puts x["id"]
		puts x["perf"]["name"]
		puts "\n"
		puts x["createdBy"]
		puts "\n"
	}
puts a.length
list=a
types=["Classical","Blitz","Bullet"]
avail=[]
Tournament.all.each {|x| avail<<x["tid"]}
types.each{ |type|
	puts type
	a=list.select{ |x| 
		x["perf"]["name"]==type
	}
	a.each { |x| 

		if avail.include? x["id"] && !x["createdBy"]=="lichess"
			next
		end
		
		t=Tournament.new
		t.tid=x["id"]
		puts t.tid
		t.name=x["fullName"]
		puts t.name
		t.end=Time.at(x["finishesAt"])
		puts t.end
		tour.end=content["finishesAt"]
		# puts Time.at(t.start)
			t.gametype=Gametype.find_by(name: type)
		# t.gametype=Gametype.find_by(name)
		t.save
		# end
	}

}