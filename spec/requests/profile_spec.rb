require 'rails_helper'

RSpec.describe 'Profile', type: :request do

  
  let(:user) { FactoryBot.create(:user) }
  let(:headers) { valid_headers }


  describe 'GET /profile' do
    context 'get_profile' do
       before { get '/profile', headers: valid_headers }

       it 'creates a new user' do
        expect(response).to have_http_status(:success)
      end
    end
  end

end
