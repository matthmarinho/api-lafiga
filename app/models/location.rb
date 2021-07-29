class Location < ActiveRecord::Base
    geocoded_by :location_address
    after_validation :geocode
    
    validates :postal_code, length: { minimum: 8 }, presence: true
    validates :name, presence: true, uniqueness: true
    validates :city, :state_code, :country, :address, presence: true
    
    belongs_to :user
    has_many :ratings
    has_many :comments
    
    def location_address
        [address, city, state_code, country].compact.join(', ')
    end

    def score
        Rating.where(location_id: self.id).pluck("AVG(rate)").first
    end
    
    def minimun_rate
        Rating.where(location_id: self.id).pluck("MIN(rate)").first
    end
    
    def maximun_rate
        Rating.where(location_id: self.id).pluck("MAX(rate)").first
    end
end
