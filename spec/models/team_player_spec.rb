require 'rails_helper'

RSpec.describe TeamPlayer, type: :model do
  describe 'assciations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:team) }
  end
end
