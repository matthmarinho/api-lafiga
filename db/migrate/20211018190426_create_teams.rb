class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :season
      t.integer :day
      t.text :description
      t.json :color

      t.timestamps
    end
  end
end
