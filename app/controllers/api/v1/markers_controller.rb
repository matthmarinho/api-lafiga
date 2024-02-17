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
            markerable = new_marker['markerable_type'].constantize
                .find(new_marker['markerable_id'])
                .update(new_marker['markerable'])
            
            marker = Marker.find_or_create_by(
                map_id: new_marker['map_id'], 
                markerable_type: new_marker['markerable_type'], 
                markerable_id: new_marker['markerable_id']
            )
            marker.latitude = new_marker['latitude']
            marker.longitude = new_marker['longitude']
            marker.save
            Rails.logger.info(marker.errors.inspect) 
        end
    end

    def update
        unless @marker.update(marker_params) && @marker.markerable.update(marker_params['markerable'])
            render json: { errors: @marker.errors.full_messages },
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
        params.permit(
            :data, :id, :map_id, :latitude, :longitude, :markerable_type, :markerable_id, 
            markerable: [:name, :description, :season, :day, :color]
        ).to_h
    end

    def find_marker
        @marker = Marker.find_by_id(params[:id])
    end
    
end
    