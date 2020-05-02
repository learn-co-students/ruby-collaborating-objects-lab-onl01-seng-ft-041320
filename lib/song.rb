class Song
  attr_accessor :artist, :name

  @@all = []
  def initialize(name)
    @name = name
    save
  end

  def save
    @@all << self
    #self
  end

  def self.all
    @@all
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

  def self.new_by_filename(file)
    artists_name = file.split(" - ")[0]
    song_name = file.split(" - ")[1]
    song = Song.new(song_name)
    song.artist_name = artists_name
    song
  end
end
