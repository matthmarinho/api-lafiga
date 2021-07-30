class Marker < ActiveRecord::Base
    validates :latitude, :longitude, :name, :category, presence: true
    
    belongs_to :category
    belongs_to :map
end
