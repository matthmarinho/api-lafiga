class ArticleCategory < ApplicationRecord
    has_many :subcategories, :class_name => "ArticleCategory", :foreign_key => "parent_article_category_id", :dependent => :destroy
    belongs_to :parent_article_category, :class_name => "ArticleCategory", :optional => true
end
