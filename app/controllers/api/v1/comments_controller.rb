class Api::V1::CommentsController < ApplicationController
    before_action :authorize_request
    before_action :find_comment, only: [:create, :index]

    def index
        @comments = Comment.where(location_id: params[:location_id])
        render json: @comments, status: :ok, each_serializer: CommentsSerializer
    end
    
    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = @current_user.id

        if @comment.save
            render json: @comment, status: :created 
        else
            render json: { errors: @comment.errors.full_messages },
                           status: :unprocessable_entity
        end
    end

    def show
        @comments = Comment.where("comments.id = (?)", params[:id])
        render json: @comments, status: :ok, each_serializer: CommentsSerializer
    end

    def destroy
        
    end

    private

    def comment_params
        params.permit(:comment, :location_id)
    end

    def find_comment
        @comment = Comment.find_by_id(params[:location_id])
    end
    
end
    