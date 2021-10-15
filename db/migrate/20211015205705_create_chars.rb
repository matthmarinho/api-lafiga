class CreateChars < ActiveRecord::Migration[6.0]
  def change
    create_table :chars do |t|
      t.string :name
      t.string :race
      t.string :sub_race
      t.string :klass
      t.string :sub_class
      t.integer :level

      t.timestamps
    end
  end
end
