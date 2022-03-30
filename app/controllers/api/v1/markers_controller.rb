class Api::V1::MarkersController < ApplicationController
    # before_action :authorize_request
    before_action :find_marker, only: [:create, :index, :update, :destroy]

    def index
        @markers = Marker.where(map_id: params[:map_id])
        render json: @markers, status: :ok, each_serializer: MarkersSerializer
    end
    
    def new
        @marker = Marker.new
    end

    def create
        @new_markers = JSON.parse(marker_params[:data])
        @new_markers.each do |new_marker|
            marker = Marker.where(name: new_marker['name'], category_id: new_marker['category_id'], map_id: new_marker['map_id'])
                           .first_or_initialize
            marker.description = new_marker['description']
            marker.latitude = new_marker['latitude']
            marker.longitude = new_marker['longitude']
            marker.color = new_marker['color'] ? new_marker['color'] : nil
            marker.save
            Rails.logger.info(marker.errors.inspect) 
        end
    end

    def update
        unless @marker.update(update_marker_params)
            render json: { errors: @user.errors.full_messages },
                    status: :unprocessable_entity
        end
    end

    def show
        @markers = Marker.where("markers.id = (?)", params[:id])
        render json: @markers, status: :ok, each_serializer: MarkersSerializer
    end

    def destroy
        @marker.destroy
    end

    def feed
        @markers = Marker.includes(:map, :category).order(updated_at: :desc).to_json(include: [:map, :category])
        render json: @markers, status: :ok, each_serializer: MarkersSerializer
    end

    private

    def marker_params
        params.permit(:data, :map_id).to_h
    end

    def update_marker_params
        params.permit(:id, :map_id, :category_id, :name, :description, :latitude, :longitude, :color, :team_id )
    end

    def find_marker
        @marker = Marker.find_by_id(params[:id])
    end
    
end
    