class AddImageInfoToMap < ActiveRecord::Migration[6.0]
  def change
    add_column :maps, :image, :binary 
    add_column :maps, :image_name, :string 
    add_column :maps, :image_type, :string 
    add_column :maps, :height, :integer 
    add_column :maps, :width, :integer 
  end
end
