require 'rails_helper'

RSpec.describe '/teams', type: :request do
  before do
    user = create(:user)
    user.roles << Role.find_by_name('admin')
    sign_in user
  end

  let(:team) do
    create(:team)
  end

  let(:valid_attributes) do
    team_attributes = build(:team).attributes
    team_attributes[:team_players_attributes] = [{ user: create(:user) }]
    team_attributes[:tournament_id] = create(:tournament).id
    team_attributes
  end

  let(:invalid_attributes) do
    build(:team).attributes
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      create_list(:team, 3)

      get teams_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get team_url(team)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_team_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      get edit_team_url(team)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Team' do
        expect do
          post teams_url, params: { team: valid_attributes }
        end.to change(Team, :count).by(1)
      end

      it 'redirects to the created team' do
        post teams_url, params: { team: valid_attributes }
        expect(response).to redirect_to(team_url(Team.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Team' do
        expect do
          post teams_url, params: { team: invalid_attributes }
        end.to change(Team, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post teams_url, params: { team: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        { name: 'team-new-name' }
      end

      it 'updates the requested team' do
        team = Team.create! valid_attributes
        patch team_url(team), params: { team: new_attributes }
        expect(team.reload.name).to eq('team-new-name')
      end

      it 'redirects to the team' do
        team = Team.create! valid_attributes
        patch team_url(team), params: { team: new_attributes }
        team.reload
        expect(response).to redirect_to(team_url(team))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        team = Team.create! valid_attributes
        patch team_url(team), params: { team: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested team' do
      team = Team.create! valid_attributes
      expect do
        delete team_url(team)
      end.to change(Team, :count).by(-1)
    end

    it 'redirects to the teams list' do
      team = Team.create! valid_attributes
      delete team_url(team)
      expect(response).to redirect_to(teams_url)
    end
  end
end
