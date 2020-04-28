class Song
  attr_accessor :artist, :name

  @@all = []

  def initialize(name)
    self.name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(filename)
    artist_name, song_name = filename.split(" - ")
    song = self.new(song_name)
    song.artist_name = artist_name
    song
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
  end
end
