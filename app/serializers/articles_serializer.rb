class ArticlesSerializer < ApplicationSerializer
    attributes :id, :title

    def image
        if object.image
            file = GoogleDriveService::Download.new({:file_name=>object.image}).call
            file.download_to_file("./tmp/storage/" + object.image)
            return File.open("./tmp/storage/" + object.image)
        end
    end
end