require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:username) }
    it { should validate_length_of(:password)} 
  end

  describe 'associations' do
    it { is_expected.to have_many(:ratings) }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:locations) }
  end
end