# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RatingsSerializer, type: :serializer do
  let(:user) { FactoryBot.create(:user, email: 'aa@a.com') }
  let(:location) { FactoryBot.create(:location) }

  describe 'serializer format' do
    it 'returns a valid format' do
      rating = FactoryBot.create(:rating, user_id: user.id, location_id: location.id)
      rating_serializer = described_class.new(rating)
      adapter = ActiveModelSerializers::Adapter.create(rating_serializer)
                                               .as_json

      expect(adapter.keys).to contain_exactly(:id, :created_by, :location_id, :rate, :created_at, :updated_at)
    end
  end
end
