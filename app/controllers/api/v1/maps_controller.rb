class Api::V1::MapsController < ApplicationController
    # before_action :authorize_request
    before_action :find_map, only: [:create, :index]

    def index
        @maps = Map.all
        render json: @maps, status: :ok, each_serializer: MapsSerializer
    end
    
    def new
        @map = Map.new
    end

    def create
        @map = Map.new(map_params)
        if @map.save
            render json: @map, status: :created 
        else
            render json: { errors: @map.errors.full_messages },
                           status: :unprocessable_entity
        end
    end

    def show
        @maps = Map.where("maps.id = (?)", params[:id])
        render json: @maps, status: :ok, each_serializer: MapsSerializer
    end

    def destroy
        
    end

    private

    def map_params
        params.permit(:id, :name)
    end

    def find_map
        @map = Map.find_by_id(params[:id])
    end
    
end
    