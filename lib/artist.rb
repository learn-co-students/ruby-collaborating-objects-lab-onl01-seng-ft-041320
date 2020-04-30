class Artist
  attr_accessor :name, :songs

    @@all = []

  def initialize (name)
    @name = name
    @@all << self
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song
  end

  def self.find_or_create_by_name(name)
   find_or_create_name = @@all.find do |artist| artist.name == name
   end
   if find_or_create_name == nil
     self.new(name)
   else
    find_or_create_name
   end
  end

  def print_songs
   puts @songs.collect {|song| song.name}
  end

end
