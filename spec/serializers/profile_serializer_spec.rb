# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProfileSerializer, type: :serializer do
  let(:user) { FactoryBot.create(:user) }

  describe 'serializer format' do
    it 'returns a valid format' do
      profile_serializer = described_class.new(user)
      adapter = ActiveModelSerializers::Adapter.create(profile_serializer)
                                               .as_json

      expect(adapter.keys).to contain_exactly(:name, :email, :locations, :ratings)
    end
  end
end
