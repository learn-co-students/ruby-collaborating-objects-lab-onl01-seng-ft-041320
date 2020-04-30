# class MP3Importer
#   attr_accessor :path
#   @@all = []
#
#   def initialize(path)
#     @path = path
#   end
#
# end
class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        filenames = Dir.chdir(@path) do | path |
            Dir.glob("*.mp3")
        end
        puts "names=#{filenames}"
        filenames
    end
    def import
    self.files.each do |filename|
      Song.new_by_filename(filename)
    end
  end
end
