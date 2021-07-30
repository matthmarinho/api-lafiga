class Map < ApplicationRecord
    validates :name, presence: true
    
    has_many :markers
    # belongs_to :user
end
