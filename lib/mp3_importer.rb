require 'pry'
class MP3Importer
    attr_reader :path, :files


    def initialize(path)
        @path = path
        #1.Dir["/path/to/search/*"]
        #2. turn into an array to use grep
        #3. grep creates an array
    end

    def files
        files = Dir.glob("#{path}/*.mp3").map do|path_file|  
        path_file.gsub('./spec/fixtures/mp3s/','')
        # binding.pry
        # files = Dir["/path/to/search/*"].grep(/.*\.mp3/)
        # files = Dir["#{path}/*.mp3"].grep(/.*\.mp3/).map 
        # {|path_file| path_file.gsub('./spec/fixutres/mp3s/', '')}
        #gsub method
        #remove the path name
        end

    end

    def import
        self.files.each {|file| Song.new_by_filename(file)}
    end
    
    # binding.pry



end