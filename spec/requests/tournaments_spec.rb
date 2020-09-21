require 'rails_helper'

RSpec.describe '/tournaments', type: :request do
  before do
    user = create(:user)
    user.roles << Role.find_by_name('admin')
    sign_in user
  end

  let(:tournament) { create(:tournament) }

  let(:valid_attributes) do
    build(:tournament).attributes
  end

  let(:invalid_attributes) do
    tournament_attributes = build(:tournament).attributes
    tournament_attributes[:name] = nil
    tournament_attributes
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Tournament.create! valid_attributes
      get tournaments_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      tournament = Tournament.create! valid_attributes
      get tournament_url(tournament)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_tournament_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      tournament = Tournament.create! valid_attributes
      get edit_tournament_url(tournament)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Tournament' do
        expect do
          post tournaments_url, params: { tournament: valid_attributes }
        end.to change(Tournament, :count).by(1)
      end

      it 'redirects to the created tournament' do
        post tournaments_url, params: { tournament: valid_attributes }
        expect(response).to redirect_to(tournament_url(Tournament.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Tournament' do
        expect do
          post tournaments_url, params: { tournament: invalid_attributes }
        end.to change(Tournament, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post tournaments_url, params: { tournament: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        { name: 'updated-tournament-name' }
      end

      it 'updates the requested tournament' do
        tournament = Tournament.create! valid_attributes
        patch tournament_url(tournament), params: { tournament: new_attributes }
        expect(tournament.reload.name).to eq('updated-tournament-name')
      end

      it 'redirects to the tournament' do
        tournament = Tournament.create! valid_attributes
        patch tournament_url(tournament), params: { tournament: new_attributes }
        tournament.reload
        expect(response).to redirect_to(tournament_url(tournament))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        tournament = Tournament.create! valid_attributes
        patch tournament_url(tournament), params: { tournament: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested tournament' do
      tournament = Tournament.create! valid_attributes
      expect do
        delete tournament_url(tournament)
      end.to change(Tournament, :count).by(-1)
    end

    it 'redirects to the tournaments list' do
      tournament = Tournament.create! valid_attributes
      delete tournament_url(tournament)
      expect(response).to redirect_to(tournaments_url)
    end
  end
end
