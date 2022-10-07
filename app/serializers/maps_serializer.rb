class MapsSerializer < ApplicationSerializer
    attributes :id, :name, :image, :image_name

    def image
        if object.image
            File.open(object.image_name, "wb") do |file|
                return "data:image/" + object.image_type + ";base64," + object.image.gsub("\n", '')
            end
        end
    end
end