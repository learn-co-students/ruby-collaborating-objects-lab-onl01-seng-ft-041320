class MP3Importer

    attr_accessor :path

    def initialize(path)
        @path = path
    end


    def files
        #@files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
        Dir.entries(@path).select {|file| file.include? (".mp3")}
    end

    def import
        self.files.each {|mp3| Song.new_by_filename(mp3)}
    end

end
