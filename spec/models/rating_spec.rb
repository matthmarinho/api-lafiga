require 'rails_helper'

RSpec.describe Rating, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:rate) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:location) }
  end
end