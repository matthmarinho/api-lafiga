
module GoogleDriveService
 
  class Upload
 
    require 'google_drive'
 
    def initialize(params)
      @file_name = params[:file_name]
      @file_path = params[:file_path]
    end
    
    def call
      @session = GoogleDrive::Session.from_config("lafiga-config.json")
      @session.upload_from_file(@file_path, @file_name, convert: false)
    end
 
  end

  class Download
 
    require 'google_drive'
 
    def initialize(params)
      @file_name = params[:file_name]
    end
 
    def call
      @session = GoogleDrive::Session.from_config("lafiga-config.json")
      file = @session.file_by_title(@file_name)
      pp '-------------------------------------------'
      pp file
      # file.download_to_file("teste.png")
    end
 
  end
end

# require "google_drive"
# class GoogleDriveService

#   def self.get_session
#     session = GoogleDrive::Session.from_config("lafiga-config.json")
#   end

#   def self.upload_file(file_path, file_name)
#     session = get_session
#     session.upload_from_file(file_path, file_name, convert: false)
#   end

#   def self.download_file(file_name)
#     session = get_session
#     file = session.file_by_title(file_name)
#     pp file
#     # blank_file = File.write(File.join(__dir__, 'downloads', file_name), nil)
#     # file.download_to_file(blank_file.path)
#   end

#   # # Uploads a local file.
#   # session.upload_from_file("/path/to/hello.txt", "hello.txt", convert: false)

#   # # Downloads to a local file.
#   # file = session.file_by_title("hello.txt")
#   # file.download_to_file("/path/to/hello.txt")

#   # # Updates content of the remote file.
#   # file.update_from_file("/path/to/hello.txt")
# end