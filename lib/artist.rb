class Artist 
  attr_accessor :name 
  
  @@all = []
  
  def initialize (name)
    @name = name 
    @@all << self 
  end
  
  def self.all
    @@all 
  end
  
  def add_song(song) 
    song.artist = self
  end
  
  def songs 
    Song.all.select {|song| song.artist == self}
  end
  
  def self.find_or_create_by_name(find_name)
    found = self.all.detect {|artist| artist.name == find_name}
    if found
      found
    else
      self.new(find_name)
    end
  end
  
  def print_songs
    songs.each {|song| puts song.name}
  end
end