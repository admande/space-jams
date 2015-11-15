require 'time'
require 'pry'

class Album

  attr_accessor :album_id, :id, :album_name, :artists, :title, :track_number, :artists, :tracks, :duration_min

  def initialize(row_hash)
    @album_id = row_hash[:album_id].strip
    @id = row_hash[:track_id].strip
    @title = row_hash[:title].strip
    @track_number = row_hash[:track_number].strip
    @duration_min = duration_min
    @album_name = row_hash[:album_name].strip
    @artists = row_hash[:artists].strip
    @tracks = []
  end

  def summary
    summary = ""
    summary += "Name: #{@album_name}\n"
    summary += "Artist(s): #{@artists}\n"
    total_time_ms = 0
    @tracks.each do |track|
      total_time_ms += track[:duration_ms].to_f
    end
    @duration_min = (total_time_ms/60000).round(2)
    summary += "Duration （min): #{@duration_min}\n"
    summary += "Tracks:\n"
    @tracks.each do |track|
      summary += "- #{track[:title]}\n"
    end
    puts "\n" + summary
  end
end


# Name: Space Jams
# Artist(s): Tony Wrecks
# Duration (min.): 41.45
# Tracks:
# - Bout My Bread
# - Grindin Skit
# - Drop It In Tha Bank
# - Batter Up
# - I Get Toe Up
# - My Drop
# - Heavyweights
# - Preapproved - Freestyle
# - Soldiers
# - Don't Wanna See Me
# - Lookin Clean
# - One For Tha Money
# - Toe Up Slowed And Chopped
# - Swagger Up Slowed And Chopped

#:track_id, :title, :track_number, :duration_min,
