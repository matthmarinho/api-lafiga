class Api::V1::UploadsController < ApplicationController
  before_action :set_upload, only: [:show, :update, :destroy]

  def index
    @uploads = Upload.all

    render json: @uploads, status: :ok, each_serializer: UploadSerializer
  end

  def show
    render json: @upload
  end

  def create
    @upload = Upload.new(upload_params)
    if @upload.save
      render json: @upload, status: :created, location: @upload
    else
      render json: @upload.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @upload.update(upload_params)
      render json: @upload, status: :ok, each_serializer: UploadSerializer
    else
      render json: @upload.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @upload.destroy
  end

  def remove_in_batches
    @upload = JSON.parse(upload_destroy_params[:data])
    @upload.each do |char|
      Upload.find_by_id(char['id']).destroy
    end
  end

  private
    def set_upload
      @upload = Upload.find(params[:id])
    end

    def upload_params
      params.permit(:title, :description, :attachment)
    end

    def upload_destroy_params
      params.permit(:data).to_h
  end
end
