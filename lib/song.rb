# Responsible for creating songs given each filename and sending the artists name(a string) to the Artist class
# Relies on the Artist instances to build associations
require "pry"
class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        # @songs = []
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        song_file = filename.chomp(".mp3").split(" - ")
        song = Song.new(song_file[1])
        song.artist_name = song_file[0]
        song
        # artist_name, song_name, extra = filename.chomp(".mp3").split(" - ")
        # song = self.new(song_name)
        # song.artist_name = artist_name
        # artist = Artist.find_or_create_by_name(artist_name)
        # artist.add_song(song)
        # song
        # binding.pry
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        # artist.add_song(self)
        # binding.pry
    end
end