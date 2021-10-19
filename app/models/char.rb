class Char < ApplicationRecord
    validates :name, :klass, :race, :sub_class, :level, presence: true

    has_and_belongs_to_many :team
end
