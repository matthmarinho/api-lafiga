require 'rails_helper'

RSpec.describe 'Api::V1::Locations', type: :request do

  
  let(:user) { FactoryBot.create(:user, username: 'new_user', password: "new_password", email: 'exemple@exemple.com', id: 2) }

  let(:headers) { valid_headers }


  describe 'GET /api/v1/locations' do
    let(:location) {FactoryBot.create_list(:location, 10) }
    it 'get_locations_by_list' do
      get api_v1_locations_path, headers: valid_headers, params: {type: 'list'}

      expect(response).to have_http_status(:success)
    end

    it 'get_locations_by_map' do
      get api_v1_locations_path, headers: valid_headers, params: {type: 'map'}

      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /api/v1/locations' do
    let(:valid_attributes) do
      FactoryBot.attributes_for(:location)
    end

     it 'create_location' do
      post api_v1_locations_path, headers: valid_headers, params: valid_attributes 

      expect(response).to have_http_status(:created)
    end
  end

  describe 'PUT /api/v1/locations/:id' do
    let(:locations) {FactoryBot.create_list(:location, 1) }
    let(:location_id) { locations.first.id }
    let(:valid_attributes)  { { name: 'Other Place Name' } }

     it 'update_location' do
      put api_v1_location_path(location_id), headers: valid_headers, params: valid_attributes 
      expect(response).to have_http_status(:ok)
    end
  end

end
