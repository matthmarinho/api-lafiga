
class ProfileController < ApplicationController
    before_action :authorize_request
        
    def index
        @response = User.find(@current_user.id)
        respond
    end

    private

    def respond
        if @response
            render json: @response, status: 200, serializer: ProfileSerializer
        else
            render json: { errors: @response.errors }, status: 403
        end
    end

    def user_params
        params.permit(
        :name, :email, :password, :password_confirmation
        )
    end
end
