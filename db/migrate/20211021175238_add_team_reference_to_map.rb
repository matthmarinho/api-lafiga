class AddTeamReferenceToMap < ActiveRecord::Migration[6.0]
  def change
    add_reference :markers, :team, index: true, foreign_key: true
  end
end
