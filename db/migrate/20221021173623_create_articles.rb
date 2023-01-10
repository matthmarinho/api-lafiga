class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.json :content
      t.string :image
      t.string :gallery, array: true, default: []
      t.timestamps
    end
  end
end
