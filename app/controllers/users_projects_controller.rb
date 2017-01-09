class UsersProjectsController < ApplicationController


  def update
    @users_project = UsersProject.find(params[:id])
    if @users_project.update(users_project_params)
      flash[:notice] = t('models.user_projects.role_updated')
    end
    redirect_to edit_project_path(Team.find(@users_project.project_id))
  end

  private
    def users_project_params
      params.require(:users_project).permit(:user_project_role)
    end
end
