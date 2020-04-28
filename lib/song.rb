require 'pry'
class Song 
    attr_accessor :name, :artist
    @@all = []
 def initialize(name)
  @name = name
  @@all << self
 end

 def name=(name)
  @name = name 
 end 

 def self.all
  @@all
 end 

 def self.new_by_filename(file) # file = "Michael Jackson - Black or White - Pop.mp3"
  artist, song = file.split(" - ") # => ["Michael Jackson", "Black or White", "Pop.mp3"]
  new_song = self.new(song)
  new_song.artist_name = artist
  new_song
 end

 def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by_name(artist_name)

 end

end 