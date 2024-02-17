class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]

  def index
    @articles = Article.all
    render json: @articles, status: :ok, each_serializer: ArticlesSerializer
  end

  def show
    render json: @article
  end

  def create
    @article = Article.new()

    params = article_params
    @article.title = params['title']
    @article.content = params['content']

    image = params['image']
    image_name = image.original_filename
    image_path = image.path

    GoogleDriveService::Upload.new({file_path: image_path, file_name: image_name}).call

    @article.image = image_name
    
    if @article.save
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def remove_in_batches
    @articles = JSON.parse(article_destroy_params[:data])
    @articles.each do |article|
      Article.find_by_id(article['id']).destroy
    end
  end

  def destroy
    @article.destroy
  end

  private
    def set_article
      @article = Article.find(article_params[:id])
    end

    def article_params
      params.permit(:id, :content, :title, :image, :gallery)
    end

    def article_destroy_params
      params.permit(:data).to_h
    end
end
