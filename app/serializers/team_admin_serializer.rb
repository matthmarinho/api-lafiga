class TeamAdminSerializer < ApplicationSerializer
  attributes :id, :name, :day, :season

  has_many :chars, serializer: CharSerializer
end
