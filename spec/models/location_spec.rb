require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:postal_code) }
    it { should validate_length_of(:postal_code).is_at_least(8) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state_code) }
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:address) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:ratings) }
    it { is_expected.to have_many(:comments) }
  end

end
