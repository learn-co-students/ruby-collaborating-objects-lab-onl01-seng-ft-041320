# require 'pry'
class Song

    attr_accessor :artist, :name
    #the blongs_to relationship keeps track of the instance that it belongs to 
    #in this case, the artist 
    @@all = []
    #<Song#03948503845name="Whatever">
    def initialize (name)
        @name = name
        @@all << self
        #self refers to the instance that this method is called on 
        #song = Song.new
        #song.initialize(...args)
    end

    #new_song = Song.new 
    #new_song.save
    #whatever comes before the method is what self is 
    #in this case it's new_song


    def self.all
        #self here would refer to the class itself 
        @@all 
    end

    def self.new_by_filename(file)
      song_info = file.split(" - ")
      artist_string = song_info[0]
      song_title = song_info[1]
      # song_genre = song_info[2].gsub('.mp3', '')
      song_new = Song.new(song_title)
      # binding.pry
      song_new.artist_name= artist_string
      song_new
    end
    #Song.all 
    #We called .all on `Song`, so in this case, self inside of self.all would refer to the class

    def artist_name=(name)
      # binding.pry
      if (self.artist.nil?)
        self.artist = Artist.find_or_create_by_name(name)
        self.artist.add_song(self) 
      end
      
    end



end

#If self is in a class method, it refers to the class
#If self is in an instance method, it refers to the instance 

#Class: Song.all
#Instance: <Song#3405830945 name="Old Town Road">.name

