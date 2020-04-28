class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    self.name = name
    self.songs = []
    @@all << self
  end

  def self.all
    @@all
  end

  def add_song(song)
    songs << song
    song.artist = self
  end

  def songs
    Song.all.select { |song| song.artist == self }
  end

  def self.find_or_create_by_name(name)
    @@all.find { |a| a.name == name } || new(name)
  end

  def print_songs
    songs.each { |song| puts song.name }
  end
end
