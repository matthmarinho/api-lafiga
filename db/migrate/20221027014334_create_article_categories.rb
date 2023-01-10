class CreateArticleCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :article_categories do |t|
      t.string :name
      t.references  :parent_article_category, foreign_key: { to_table: :article_categories }
      t.timestamps
    end
  end
end
