class CreateCharsTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :chars_teams do |t|
      t.belongs_to :team
      t.belongs_to :char
    end
  end
end
