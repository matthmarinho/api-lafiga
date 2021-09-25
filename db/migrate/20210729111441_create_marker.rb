class CreateMarker < ActiveRecord::Migration[6.0]
  def change
    create_table :markers do |t|
      t.references :map, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.float :latitude
      t.float :longitude
      t.json :color

      t.timestamps
    end
  end
end
