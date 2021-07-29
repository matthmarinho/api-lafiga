class RatingsSerializer < ApplicationSerializer
    attributes :id, :created_by, :location_id, :rate, :created_at, :updated_at

    def created_by
        object.user.name
    end
end