class MarkersSerializer < ApplicationSerializer
    attributes :id, :map_id, :category, :name, :description, :latitude, :longitude, :color, :team
end