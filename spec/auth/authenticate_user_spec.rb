require 'rails_helper'

RSpec.describe AuthenticateAccess do

  let(:user) { FactoryBot.create(:user, username: 'new_user', password: "new_password", email: 'exemple@exemple.com', id: 2) }

  subject(:valid_auth_obj) { described_class.new(user.email, user.password) }

  subject(:invalid_auth_obj) { described_class.new('foo', 'bar') }


  describe '#call' do

    context 'when valid credentials' do
      it 'returns an auth token' do
        token = valid_auth_obj.call
        expect(token).not_to be_nil
      end
    end


    context 'when invalid credentials' do
      it 'raises an authentication error' do
        invalid_auth_obj

        expect { invalid_auth_obj.call }
          .to raise_error(
            ExceptionHandler::AuthenticationError,
            /Invalid credentials/
          )
      end
    end
  end
end