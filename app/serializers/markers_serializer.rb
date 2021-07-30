class MarkersSerializer < ApplicationSerializer
    attributes :id, :map_id, :category_id, :category_name, :name, :discription, :latitude, :longitude 

    def category_name
        object.category.name
    end
end