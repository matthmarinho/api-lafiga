# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsSerializer, type: :serializer do
  let(:user) { FactoryBot.create(:user, email: 'aa@a.com') }
  let(:location) { FactoryBot.create(:location) }

  describe 'serializer format' do
    it 'returns a valid format' do
      comment = FactoryBot.create(:comment, user_id: user.id, location_id: location.id)
      comment_serializer = described_class.new(comment)
      adapter = ActiveModelSerializers::Adapter.create(comment_serializer)
                                               .as_json

      expect(adapter.keys).to contain_exactly(:id, :created_by, :location_id, :comment, :created_at, :updated_at)
    end
  end
end
