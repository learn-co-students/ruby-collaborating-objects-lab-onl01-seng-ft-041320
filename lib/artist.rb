class Artist   
@@all = []
attr_accessor :name
  def initialize(name)
    @name = name 
    @@all << self
  end

  def name=(name)
    @name = name
  end

  def self.all
    @@all
  end 

  def songs
    Song.all.select do |song|
      song.artist == self
    end 
  end

  def add_song(song)
   song.artist = self
  end 
  
  def self.find(name)
    self.all.find{|artist| artist.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find(name) ? self.find(name) : name = Artist.new(name)
  end
  
  def print_songs
    songs.each do |song|
     puts song.name
    end
  end
end 