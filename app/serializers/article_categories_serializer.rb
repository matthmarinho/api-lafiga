class ArticleCategoriesSerializer < ApplicationSerializer
    attributes :id, :name, :type, :sub_categories

    def type    
        return object.parent_article_category_id ? 'SubCategory' : 'Category'
    end

    def sub_categories
        return object.subcategories
    end
end