class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def artist_name=(name)
        @artist = Artist.find_or_create_by_name(name)
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        new_song = self.new( filename.split(" - ")[1] )
        new_song.artist_name = filename.split(" - ")[0]
        @@all << new_song
        new_song.artist.add_song(new_song)

        new_song
    end
end