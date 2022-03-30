class Team < ApplicationRecord
    has_and_belongs_to_many :chars
    has_one :team
end
