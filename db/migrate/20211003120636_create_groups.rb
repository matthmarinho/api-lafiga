class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :season
      t.integer :day

      t.timestamps
    end
  end
end
