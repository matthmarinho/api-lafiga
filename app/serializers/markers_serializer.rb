class MarkersSerializer < ApplicationSerializer
    attributes :id, :map_id, :category_id, :category_name, :name, :description, :latitude, :longitude, :color

    def category_name
        object.category.name
    end
end