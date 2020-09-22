require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'assciations' do
    it { is_expected.to have_many(:team_players).inverse_of(:team) }
    it { is_expected.to belong_to(:tournament) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it 'valid with 5 maxmum team players ' do
      team = create(:team)
      team_players = create_list(:team_player, 6, team: team)

      expect(team.reload.valid?).to be_falsy
      expect(team.errors.full_messages).to include('Team players only 5 player allowed')
    end
  end

  describe 'callbacks' do
    it { is_expected.to callback(:default_status).before(:validation) }
  end
end
