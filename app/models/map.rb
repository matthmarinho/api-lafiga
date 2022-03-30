class Map < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    
    has_many :markers, dependent: :delete_all
    # belongs_to :user
end
