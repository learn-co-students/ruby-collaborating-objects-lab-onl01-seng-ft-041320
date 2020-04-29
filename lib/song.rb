
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
      artist, song = filename.split(" - ")
      new_song = self.new(song)
      artist = new_song.artist_name
      new_song
    end

    def artist_name=(name)  #setter method has method=(argument)
      self.artist = Artist.find_or_create_by_name(name)
      artist.add_song(self)
    end

  end
    