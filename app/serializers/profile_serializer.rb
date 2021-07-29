class ProfileSerializer < ApplicationSerializer
    attributes :name, :email
    
    has_many :locations
    has_many :ratings
end