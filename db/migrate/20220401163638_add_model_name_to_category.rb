class AddModelNameToCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :class_name, :string
  end
end
