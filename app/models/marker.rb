class Marker < ActiveRecord::Base
    validates :latitude, :longitude, :name, :category, presence: true
    
    belongs_to :category
    belongs_to :map
    belongs_to :team, optional: true
end
