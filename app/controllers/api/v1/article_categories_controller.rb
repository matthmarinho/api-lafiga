class Api::V1::ArticleCategoriesController < ApplicationController
  before_action :set_article_categories, only: [:show, :update, :destroy]

  def index
    @article_categories = ArticleCategory.all
    render json: @article_categories, status: :ok, each_serializer: ArticleCategoriesSerializer
  end

  def show
    render json: @article_categories
  end

  def create
    @article_categories = ArticleCategory.new()

    @article_categories.name = article_categories_params['name']
    @article_categories.subcategories = ArticleCategory.where(id: article_categories_params['sub_categories'])
    
    if @article_categories.save
      render json: @article_categories, status: :created
    else
      render json: @article_categories.errors, status: :unprocessable_entity
    end
  end

  def update
    @article_categories.subcategories = ArticleCategory.where(id: article_categories_params['sub_categories'])

    if @article_categories.update(article_categories_params)
      render json: @article_categories
    else
      render json: @article_categories.errors, status: :unprocessable_entity
    end
  end

  def remove_in_batches
    @article_categories = JSON.parse(article_categories_destroy_params[:data])
    @article_categories.each do |article_categories|
      ArticleCategory.find_by_id(article_categories['id']).destroy
    end
  end

  def destroy
    @article_categories.destroy
  end

  private
    def set_article_categories
      @article_categories = ArticleCategory.find(article_categories_params[:id])
    end

    def article_categories_params
      params.permit(:id, :name, :sub_categories)
    end

    def article_categories_destroy_params
      params.permit(:data).to_h
    end
end
