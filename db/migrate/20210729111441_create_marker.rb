class CreateMarker < ActiveRecord::Migration[6.0]
  def change
    create_table :markers do |t|
      t.belongs_to :map, null: false, foreign_key: true
      t.references :markerable, polymorphic: true, null: false
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
