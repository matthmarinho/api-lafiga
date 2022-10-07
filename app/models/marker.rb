class Marker < ActiveRecord::Base
    validates :latitude, :longitude, presence: true

    belongs_to :map
    belongs_to :markerable, polymorphic: true
end
