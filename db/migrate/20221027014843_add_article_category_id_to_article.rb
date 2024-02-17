class AddArticleCategoryIdToArticle < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :article_category_id, :integer
  end
end
