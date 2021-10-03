class Group < ApplicationRecord
    validates :name, :season, :day, presence: true
    
    has_many :players, dependent: :delete_all, inverse_of:  :group,
                      class_name:  'Group::Player'
    
    after_commit :update_player

    accepts_nested_attributes_for :players

    def update_player
    
    end

end
