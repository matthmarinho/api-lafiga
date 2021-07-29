
class Api::V1::LocationsController < ApplicationController
  before_action :authorize_request
  before_action :find_location, except: %i[create index]
    
  def index
    case params[:type]
      when 'map'
        @request = Location.joins(:user).near([params[:latitude], params[:longitude]], 1000, units: :km)
        @serializer = LocationsSerializer
      when 'list'
        @request = Location.joins(:user).order(name: :asc)
        @serializer = LocationsListSerializer
    end
      return_request
  end

  def show
    render json: @location, status: :ok
  end
  
  def create 
    @location = Location.new(location_params)
    @location.user_id = @current_user.id

    if @location.save
      render json: @location, status: :created 
    else
      render json: { errors: @location.errors.full_messages },
              status: :unprocessable_entity
    end
  end
  
  def update
    return render json: @location, status: :ok if @location.update(location_params)
    render json: { errors: @location.errors.full_messages },
            status: :unprocessable_entity
  end

  def destroy
    @location.destroy
  end

  private

  def return_request
    if @request && @serializer
      render json: @request, status: 200, each_serializer: @serializer
    else
      render json: { errors: @request.errors }, status: 403
    end
  end

  def find_location
    @location = Location.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'Location not found' }, status: 403
  end

  def location_params
    params.permit(
      :name, :postal_code, :number, :address, :latitude, :longitude, :city, :state_code, :country, :coordinates
    )
  end
end
    