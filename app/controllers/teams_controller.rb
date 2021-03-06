class TeamsController < ApplicationController
  load_and_authorize_resource

  before_action :set_team, only: [:show, :edit, :update, :destroy]
  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
  end

  # GET /teams/new
  def new
    #@team = Team.new
    build_team_players
  end

  # GET /teams/1/edit
  def edit
    build_team_players
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)
    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def approve
    respond_to do |format|
      if @team.approved!
        format.html { redirect_to @team, notice: 'Team was successfully approved.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :show }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def reject
    respond_to do |format|
      if @team.rejected!
        format.html { redirect_to @team, notice: 'Team was successfully rejected.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :show }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
    @teams =  case params[:commit].downcase
                    when "pending" then Team.pending
                    when "approved" then Team.approved
                    when "rejected" then Team.rejected
                    else Team.all
                    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def team_params
      params.require(:team).permit(:name, :tournament_id, :status, team_players_attributes: [:id, :team_id, :user_id])

    end

    def build_team_players
      count = @team.team_players.count
      count =  5 - count
      count.times { @team.team_players.build }
    end
end
