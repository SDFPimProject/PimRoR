class TeamsController < ApplicationController
  load_and_authorize_resource
  layout "settingsmenu"
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    if (current_user.role == "admin" || current_user.role == "manager")
      @teams = Team.page(params[:page])
    else
      userteams = current_user.users_teams.where("user_team_role = ?", "manager")
      @teams = current_user.teams.where(id: userteams.pluck(:team_id)).page(params[:page])
    end
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @team_users = @team.users.page(params[:teamUserPage])
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
    @users = User.where.not(id: @team.users).page(params[:userPage])
    @team_users = @team.users_teams.page(params[:teamUserPage])
  end

  # POST /teams/1/user/1/remove
  def removeUser 
    @team = Team.find(params[:teamid])
    @user = User.find(params[:userid])
    @team.users.destroy(@user)
    redirect_to edit_team_path(@team)
  end

   # POST /teams/1/user/1/add
  def addUser 
    @team = Team.find(params[:teamid])
    @user = User.find(params[:userid])
    @team.users << @user
    redirect_to edit_team_path(@team)
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
    if @team.update(team_params)
      flash[:notice] = "Team erfolgreich aktuallisiert."
      redirect_to team_path
    else
      @users = User.where.not(id: @team.users).page(params[:userPage])
      @team_users = @team.users_teams.page(params[:teamUserPage])
      render :action => 'edit'
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name)
    end

    def team_user_params
      params.permit(:teamid, :userid)
    end
end
