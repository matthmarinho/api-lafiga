class Team < ApplicationRecord
    has_and_belongs_to_many :chars
    has_many :markers, as: :markerable

    accepts_nested_attributes_for :markers

    validates :name, uniqueness: true
end
