class Char < ApplicationRecord
    validates :name, :klass, :race, :sub_class, :level, presence: true
end
