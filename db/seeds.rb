# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
gta_url      = "http://static.gamespot.com/uploads/original/1534/15343359/2378983-gta-v-big.jpg"
red_dead_url = "http://upload.wikimedia.org/wikipedia/pt/a/a7/Red_Dead_Redemption.jpg"
batman_url   = "http://www.hdwallpapers.in/walls/batman_the_dark_knight_returns_part_1_movie-wide.jpg"
today = Date.today
current = Game.new(title: "gta v", state: "current", remote_cover: gta_url, started_on: today, url: "http://www.google.com", forum_url: "http://www.google.com")
current.save

finished1 = Game.new(title: "red dead redemption", state: "finished", remote_cover: red_dead_url, started_on: today,  url: "http://www.google.com", forum_url: "http://www.google.com")
finished1.save

finished2 = Game.new(title: "batman", state: "finished", remote_cover: batman_url, started_on: today, url: "http://www.google.com", forum_url: "http://www.google.com")
finished2.save
