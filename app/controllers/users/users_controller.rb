class Users::UsersController < ApplicationController
   load_and_authorize_resource
   layout "users"

  def index
     @users = User.all.page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    params.permit!
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created User." 
      redirect_to root_path
    else
      render :action => 'new'
    end
  end

  def user_params
    params.require(:user).permit(:email, :email_confirmation ,:first_name, :last_name, :role, :street_and_nr, :zip_code, :state, :password, :password_confirmation)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    params.permit!
    @user = User.find(params[:id])
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated User."
      redirect_to user_index_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to root_path
    end
  end 
end
