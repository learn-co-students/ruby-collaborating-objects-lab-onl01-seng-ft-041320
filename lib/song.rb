require 'pry'

class Song
    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        title = filename.split(" - ")[1]
        artist = filename.split(" - ")[0]
        song = Song.new(title)
        # binding.pry
        song.artist_name = artist
        song
    end

    def artist_name=(artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name)
        # if (Artist.all.any? { |artist| artist.name == artist_name })
        #     self.artist = Artist.all.find { |aritist| artist.name == artist_name }
        # else #create a new artist
        #     artist = Artist.new(artist_name)
        #     self.artist = artist
        # end
    end
end