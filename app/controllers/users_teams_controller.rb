class UsersTeamsController < ApplicationController

  def update
    @users_team = UsersTeam.find(params[:id])
    if @users_team.update(users_team_params)
      flash[:notice] = t('models.user_projects.role_updated')
    end
    redirect_to edit_team_path(Team.find(@users_team.team_id))
  end

  private
    def users_team_params
      params.require(:users_team).permit(:user_team_role)
    end
end
