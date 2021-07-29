class CommentsSerializer < ApplicationSerializer
    attributes :id, :created_by, :location_id, :comment, :created_at, :updated_at

    def created_by
        object.user.name
    end
end