class CreateGroupPlayer < ActiveRecord::Migration[6.0]
  def change
    create_table :group_players do |t|
      t.string :name
      
      t.references :group, null: false, foreign_key: true
    end
  end
end
