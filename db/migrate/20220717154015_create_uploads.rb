class CreateUploads < ActiveRecord::Migration[6.0]
  def change
    create_table :uploads do |t|
      t.string :title
      t.string :description
      t.string :attachment
    end
  end
end
