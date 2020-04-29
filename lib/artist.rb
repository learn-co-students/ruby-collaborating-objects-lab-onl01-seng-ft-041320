
require "pry"
require "byebug"
class Artist

  attr_accessor :name, :songs
      @@all =[]

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def add_song(song)
    @songs << song
  end

  def save
      @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(artist_name)
          artist = self.all.find {|artist| artist.name == artist_name}
          if artist
              artist
              else
                new_artist_name = self.new(artist_name)
                new_artist_name.save
                new_artist_name
              end
            end

            def print_songs
                @songs.each do |song|
                  puts song.name
                end
              end
end