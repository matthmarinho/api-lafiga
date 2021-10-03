class GroupsSerializer < ApplicationSerializer
    attributes :id, :name, :day,:season, :players

    has_many :players, serializer: Group::PlayersSerializer
end