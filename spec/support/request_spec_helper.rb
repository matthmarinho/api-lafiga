# frozen_string_literal: true

module RequestSpecHelper
  def json
    ActiveSupport::JSON.decode(response.body)
  end

  def authentication_headers

    let(:user) { FactoryBot.create(:user, password: 'password', id: 1) }
    let(:token_new) { JsonWebToken.encode(user_id: user.id)}
    JsonWebToken.encode(user_id: user.id)

  end
end
