# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LocationsListSerializer, type: :serializer do
  let(:user) { FactoryBot.create(:user) }

  describe 'serializer format' do
    it 'returns a valid format' do
      location = FactoryBot.create(:location)
      location_serializer = described_class.new(location)
      adapter = ActiveModelSerializers::Adapter.create(location_serializer)
                                               .as_json

      expect(adapter.keys).to contain_exactly(:name, :address, :postal_code, :longitude, :latitude, :score, :minimun_rate, :maximun_rate,
                                              :created_by, :comments, :ratings)
    end
  end
end
