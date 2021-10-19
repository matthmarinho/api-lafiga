class TeamSerializer < ApplicationSerializer
  attributes :id, :name, :day, :season, :chars

  has_many :chars, serializer: CharSerializer
end
