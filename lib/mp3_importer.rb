# the MP3Importer class will parse all the filenames in the spec/fixtures folder and send
#the filenames to the Song class
require "pry"
class MP3Importer
  attr_accessor :path

  def initialize(file_path)
    @path = file_path

  end

  def files
    Dir.chdir(self.path){|path| Dir.glob("*.mp3")}
  end
  #
  def import
    import_files =  self.files
    import_files.each{|file| Song.new_by_filename(file)}
  end

end
# binding.pry
