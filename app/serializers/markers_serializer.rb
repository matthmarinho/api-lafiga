class MarkersSerializer < ApplicationSerializer
    attributes :id, :map_id, :latitude, :longitude, :markerable_type, :markerable_id

    has_one :markerable, except: [:created_at, :updated_at]
end