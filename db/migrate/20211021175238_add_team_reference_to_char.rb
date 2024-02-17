class AddTeamReferenceToChar < ActiveRecord::Migration[6.0]
  def change
    add_reference :chars, :team, index: true, foreign_key: true
  end
end
