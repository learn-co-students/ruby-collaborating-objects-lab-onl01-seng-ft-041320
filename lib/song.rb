#the song class is responsible for creating songs given each filename and sending the
#artists name (a string) to the Artist class.
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

  def self.new_by_filename(file)
    name = file.split(" - ")[1]
    song = Song.new("#{name}")
    artist = file.split(" - ")[0]
    song.artist_name=(artist)
    song
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    self.artist = artist
  end
end
