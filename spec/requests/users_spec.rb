require 'rails_helper'

RSpec.describe 'Users', type: :request do

  
  let(:user) { FactoryBot.build(:user) }
  let(:valid_attributes) do
    FactoryBot.attributes_for(:user, password: user.password)
  end
  let(:headers) { valid_headers }


  describe 'POST /users' do
    context 'when valid request' do
      before { post '/users', params: valid_attributes }

      it 'creates a new user' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Account created successfully/)
      end

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'when invalid request' do
      before { post '/users', params: {} }

      it 'does not create a new user' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['errors'])
          .to match(["Password can't be blank", "Email can't be blank", "Email is invalid", "Username can't be blank"])
      end
    end
  end
end