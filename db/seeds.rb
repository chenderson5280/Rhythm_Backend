# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'
require 'json'
require 'pry'

Song.destroy_all

baseURL = 'https://theaudiodb.com/api/v1/json/1/mvid.php?i=112024'
data = RestClient.get(baseURL)
parsed_data = JSON.parse(data)

parsed_data["mvids"].map do |info|
    Song.create(
        title: info["strTrack"],
        video: info["strMusicVid"]
    )
end
    