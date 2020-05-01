class Artist

    attr_accessor :name, :songs

    @@all = [ ]

    def initialize (name)
        @name = name
        @songs = [ ]
        save
    end

    def save
        @@all << self
    end
    
    def self.all
        @@all
    end

    def add_song(song)
        @songs << song
        song.artist = self
        song
    end

    def songs
        @songs 
        # Song.all.select{|song| song.artist == self}
        #<Artist#34059834095 name="Adele"> == <Artist#34059834095 name="Adele">
        #Return true 
        #<Artist#34059834095 name="Adele"> -- <Artist#34023434095 name="Lil Nas">
        #REturn false
        #select returns a new array of only objects that pass the equation in the block
    end 

    def self.find_or_create_by_name(name)
        # if artist.name == self 
        #     self.all.find{|artist| artist.name == self} || Artist.new(name)
        # end
        self.all.find{|artist| artist.name == name} || Artist.new(name)
        # artist.name = self
    #     if  self.all.find{|artist| artist.name == self} || Artist.new(name)
    #         return true
    # elsif self.all.find{|artist| artist.name == self} || Artist.new(name)
    #     else 
    #         self.all.find{|artist| artist.name == name}
            # artist +=1
            #returns an artist instance with name?
            #uses find and uniq.
            #calls upon the name again?
        # end
    end

    def print_songs
       @songs.each{|song| puts song.name}
    end
    #single source of truth
    #a song belongs to an artist 
    #therefor only the song keeps track of who the artist is
    #if an artist wants to know which songs belong to it, it needs to go to the Song class and iterate
    #Single source of truth: we don't want information being stored in two different places 
    #In other words NO songs array in the artist class as an instance variable ;) 
    
end

#adele = Artist.new("Adele")
#song = Song.new("Hello")
#song.artist = adele
#adele.songs
#I only want adele's songs

#song.artist => <Artist#34059834095 name="Adele">
#song.artist != "Adele"