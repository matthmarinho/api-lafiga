class Api::V1::MarkersController < ApplicationController
    # before_action :authorize_request
    before_action :find_marker, only: [:create, :index]

    def index
        @markers = Marker.where(map_id: params[:map_id])
        render json: @markers, status: :ok, each_serializer: MarkersSerializer
    end
    
    def new
        @marker = Marker.new
    end

    def create
        @marker = Marker.new(marker_params)
        if @marker.save
            render json: @marker, status: :created 
        else
            render json: { errors: @marker.errors.full_messages },
                           status: :unprocessable_entity
        end
    end

    def show
        @markers = Marker.where("markers.id = (?)", params[:id])
        render json: @markers, status: :ok, each_serializer: MarkersSerializer
    end

    def destroy
        
    end

    private

    def marker_params
        params.permit(:id, :map_id, :category_id, :name, :discription, :latitude, :longitude )
    end

    def find_marker
        @marker = Marker.find_by_id(params[:id])
    end
    
end
    