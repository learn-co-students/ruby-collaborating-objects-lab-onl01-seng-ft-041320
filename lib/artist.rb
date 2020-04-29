class Artist
    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        @@all << self
    end

    def self.all 
        @@all
    end

    def add_song(song)  #takes an agrument of a song and links that song to the artist by telling the song it belongs to the artist
        song.artist = self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def self.find_or_create_by_name(name)
        # self.find(name) ? self.find(name) : self.new(name)
        artist = self.all.find {|artist| artist.name == name }
       if artist
        artist
       else 
        Artist.new(name)
        end

    end

    def print_songs
        songs.each {|song| puts song.name}
    end
end

