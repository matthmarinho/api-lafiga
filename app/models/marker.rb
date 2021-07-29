class Marker < ActiveRecord::Base
    after_validation :geocode

    validates :latitude, :longitude, :name, :category, presence: true
    
    belongs_to :category
    belongs_to :map
    

    def get_map_markers(map_id)
        Marker.where(map_id: map_id)
    end

end
