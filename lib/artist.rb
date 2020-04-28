require "pry"
# Responsible for either creating the artist (if the artist doesn't exist in our program yet)
# or finding the instance of that artist(if the artist does exist)
class Artist 
    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        @songs << song
        song.artist = self
    end

    def songs
        Song.all.select { |song| song.artist == self}
    end

    def self.find_or_create_by_name(name)
        # if self.find(name)
            # self.find(name)
        # else
            # self.create(name)
        # end
        self.all.detect{ |artist| artist.name == name} || new(name)
        # found_artist = self.all.find{ |artist| artist.name == name}
        # if found_artist
            # found_artist
        # else
            # new_artist = self.new(name)
            # new_artist.save
            # new_artist
        # end
    #   binding.pry
        # if (self.artist.nil?)
            # self.artist = Artist.new(name)
        # else
            # self.artist.name = name
        # end
    end

    # def self.find(name)
        # self.all.detect { |artist| artist.name == name}
    # end
# 
    # def self.create(name)
        # artist = Artist.new(name)
        # artist.save
        # artist
    # end

    def print_songs
        @songs.each { |song| puts song.name}
    end

end
