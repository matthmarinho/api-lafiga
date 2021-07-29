require 'rails_helper'

RSpec.describe 'Api::V1::Comment', type: :request do

  
  let(:user) { FactoryBot.create(:user, email: 'asa@aa.com') }
  let(:location) {FactoryBot.create_list(:location, 1) }
  let(:location_id) { location.first.id }
  let(:headers) { valid_headers }


  describe 'GET /api/v1/locations/:location_id/comments' do

    let(:comment) {FactoryBot.create(:comment, location_id: location_id) }

    it 'get_comments' do
      get api_v1_location_comments_path(location_id: location_id), 
                                        headers: valid_headers

      expect(response).to have_http_status(:success)
    end

  end

  describe 'POST /api/v1/locations/:location_id/comments' do
    let(:valid_attributes) do
      FactoryBot.attributes_for(:comment)
    end
     it 'create_comments' do
      post api_v1_location_comments_path(location_id: location_id), 
                                        headers: valid_headers, 
                                        params: valid_attributes 

      expect(response).to have_http_status(:created)
    end
  end

end
