class MP3Importer
    
    attr_accessor :path

    def initialize(path)
      @path = path
    end
  
    def files
        #dir: Directory 
        #entires : Returns an array containing all of the 
        #filenames in the given directory.
    Dir.entries(@path).select {|f| !File.directory? f}
    end
  
    def import
      files.each {|song| Song.new_by_filename(song)}
    end
  
  end