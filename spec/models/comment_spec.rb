require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:comment) }
  end

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:location) }
end
