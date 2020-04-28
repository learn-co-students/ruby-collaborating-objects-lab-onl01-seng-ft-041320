class Artist
    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        @@all << self
    end

    def add_song(song)
        @songs << song
    end

    def print_songs
        @songs.each do |song|
            puts "#{song.name}"
        end
    end

    def self.all
        @@all
    end

    def self.find_or_create_by_name(name)
        artist_search = @@all.find{|artist| artist.name == name}
        return artist_search if artist_search != nil
        self.new(name)
    end
    
end