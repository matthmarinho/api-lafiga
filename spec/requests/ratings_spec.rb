require 'rails_helper'

RSpec.describe 'Api::V1::Rating', type: :request do

  
  let(:user) { FactoryBot.create(:user, username: 'new_user', password: "new_password", email: 'exemplo@exemple.com', id: 2) }
  let(:location) {FactoryBot.create_list(:location, 1) }
  let(:location_id) { location.first.id }
  let(:headers) { valid_headers }


  describe 'GET /api/v1/locations/:location_id/ratings' do

    let(:rating) {FactoryBot.create(:rating, location_id: location_id) }

    it 'get_ratings' do
      get api_v1_location_ratings_path(location_id: location_id), 
                                        headers: valid_headers

      expect(response).to have_http_status(:success)
    end

  end

  describe 'POST /api/v1/locations/:location_id/ratings' do
    let(:valid_attributes) do
      FactoryBot.attributes_for(:rating)
    end
     it 'create_ratings' do
      post api_v1_location_ratings_path(location_id: location_id), 
                                        headers: valid_headers, 
                                        params: valid_attributes 

      expect(response).to have_http_status(:created)
    end
  end

end
