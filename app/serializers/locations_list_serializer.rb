class LocationsListSerializer < ApplicationSerializer
    attributes :name, :address, :postal_code, :longitude, :latitude, :score, :minimun_rate, :maximun_rate,
               :created_by
    
    has_many :ratings, serializer: RatingsSerializer
    has_many :comments
    
    def created_by
        object.user.name
    end
end