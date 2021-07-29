class Rating < ApplicationRecord
    validates :rate, presence: true

    belongs_to :location
    belongs_to :user
end
