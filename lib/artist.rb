require 'pry'

class Artist
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select { |song| song.artist == self }
    end

    def self.find_or_create_by_name(artist_name)
        # # binding.pry
        # if (self.all.any? { |artist| artist.name == artist_name} )
        #     self.all.find { |artist| artist.name == artist_name }
        # else
        #     artist = Artist.new(artist_name)
        # end
        self.all.find { |artist| artist.name == artist_name } || Artist.new(artist_name)
    end

    def print_songs
        self.songs.each { |song| puts song.name }
    end
end