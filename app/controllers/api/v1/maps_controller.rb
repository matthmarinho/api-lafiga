class Api::V1::MapsController < ApplicationController
    # before_action :authorize_request
    before_action :find_map, only: [:create, :index, :show, :update]

    def index
        @maps = Map.all
        render json: @maps, status: :ok, each_serializer: MapsSerializer
    end
    
    def new
        @map = Map.new
    end

    def create
        @map = Map.new(map_params)

        image = map_params['image']
        width, height = FastImage.size(image)
        type = FastImage.type(image)
        metadata = "data:image/" + type[1..-1] + ";base64,"

        @map.image = Base64.encode64(File.open(image, "rb").read)
        @map.image_name = image.original_filename
        @map.image_type = type
        @map.width = width
        @map.height = height

        if @map.save
            render json: @map, status: :created 
        else
            render json: { errors: @map.errors.full_messages },
                           status: :unprocessable_entity
        end
    end

    def update
        @params = map_params
        image = map_params['image']
        width, height = FastImage.size(image)
        type = FastImage.type(image)
        metadata = "data:image/" + type[1..-1] + ";base64,"

        @params['image'] = Base64.encode64(File.open(image, "rb").read)
        @params['image_name'] = image.original_filename
        @params['image_type'] = type
        @params['width'] = width
        @params['height'] = height
        @params['name'] = map_params['name']
        @params['id'] = map_params['id']
        
        File.delete(@map.image_name)

        if @map.update(@params)
          render json: @map, status: :ok
        else
          render json: @map.errors.full_messages, status: :unprocessable_entity
        end

      end

    def show
        render json: @map, serializer: MapsSerializer
    end

    def remove_in_batches
        @maps = JSON.parse(map_destroy_params[:data])
        @maps.each do |map|
            File.file?(map['image_name']) && File.delete(map['image_name'])
            Map.find_by_id(map['id']).destroy
        end
    end

    def getNames
        @maps = Map.all.order(:id)
        render json: @maps, status: :ok, each_serializer: NameMapsSerializer
    end

    private

    def map_params
        params.permit(:id, :name, :image)
    end

    def find_map
        @map = Map.find_by_id(params[:id])
    end

    def map_destroy_params
        params.permit(:data).to_h
    end
    
end
    