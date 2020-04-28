require "pry"

class Song
    attr_accessor :name, :artist
    @@all = []
    def initialize(name)
        @name= name
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def artist
        @artist
    end

    def self.new_by_filename(filename)
        artist_name, song_name, type = filename.split(" - ")
        song = self.new(song_name)
        song.artist_name=(artist_name)
        binding.pry
        song
    end

#tests are not passing because "michael jackson" is not being saved the first time....


   def artist_name=(name)
        artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
        self.artist = artist
    end
    

end
##########################################################
#=> #<Song:0x00007f965dd93230
 #@artist=#<Artist:0x00007f965dd93140 @name="Michael Jackson", @songs=[]>,
 #@name="Black or White">
#[2] pry(Song)> 

#second instance on black or white song creating a new michael jackson artist instance rather than adding to the first michael jackson instance
