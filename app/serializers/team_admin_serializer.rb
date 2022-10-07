class TeamAdminSerializer < ApplicationSerializer
  attributes :id, :name

  has_many :chars, serializer: CharSerializer
end
