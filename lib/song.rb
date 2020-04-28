class Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.new_by_filename(filename)
    split_name = filename.split(" - ")
    new_song = self.new(split_name[1])
    new_song.artist = Artist.find_or_create_by_name(split_name[0])
    new_song
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
  end
end
