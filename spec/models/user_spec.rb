require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:team_players).inverse_of(:user) }
  end

  describe 'callbacks' do
    it { is_expected.to callback(:default_role).after(:create) }
  end
end
