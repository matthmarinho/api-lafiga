class CreateRole < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.json :permissions,  default: {}

      t.timestamps
    end
  end
end
