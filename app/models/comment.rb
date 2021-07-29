class Comment < ApplicationRecord
    validates :comment, presence: true
    
    belongs_to :location
    belongs_to :user
end
