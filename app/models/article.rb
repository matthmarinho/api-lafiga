class Article < ApplicationRecord
    validate :title, :content, :image

    validates :article_category_id, presence: true
    belongs_to :article_category
end
