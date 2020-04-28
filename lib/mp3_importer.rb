# parse all the filenames in the spec/fixtures folder and send the filenames to the Song class
# relies on Song
class MP3Importer
    attr_accessor :path, :files

    @@directory = []

    def initialize(path)
    @path = path
    # @files = Dir.entries(path).grep(/.*\.mp3/)
    end

    def files
        files = []
        Dir.new(self.path).each do |file|
            files << file if file.length > 4
        end
        files
    end

    def import
         self.files.each do |filename|
            Song.new_by_filename(filename)
         end
        # @files.each { |file| Song.new_by_filename(file)}
    end

end