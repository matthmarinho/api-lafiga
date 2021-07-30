class Api::V1::CategoriesController < ApplicationController
    # before_action :authorize_request
    before_action :find_category, only: [:create, :index]

    def index
        @categories = Category.all
        render json: @categories, status: :ok, each_serializer: CategoriesSerializer
    end
    
    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            render json: @category, status: :created 
        else
            render json: { errors: @category.errors.full_messages },
                           status: :unprocessable_entity
        end
    end

    def show
        @categories = Category.where("categories.id = (?)", params[:id])
        render json: @categories, status: :ok, each_serializer: CategoriesSerializer
    end

    def destroy
        
    end

    private

    def category_params
        params.permit(:id, :name)
    end

    def find_category
        @category = Category.find_by_id(params[:id])
    end
    
end
    