class ApplicationController < ActionController::API
  require 'open-uri'


  def not_found
    render json: { error: 'not_found' }
  end


  def authorize_request
    @current_user = ApiRequestAuth.call(request.headers).result  

    render json: { error: 'No internet connection.' } unless internet_connection?

    render json: { error: 'Access deneid! Please, sign in to update your credentials.' }, status: 401 unless @current_user

  end

  def internet_connection?
    begin
      true if URI.open("http://www.google.com/")
    rescue
      false
    end
  end
end
