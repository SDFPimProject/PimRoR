class Users::UsersController < ApplicationController
  layout "settingsmenu"

  def index
     if(can? :show, User)
        @users = User.all.page(params[:page])
     end
  end

  def new
    if(can? :Create, User)
      @user = User.new
    else 
      redirect_to root_path
    end 
  end

  def create
    if(can? :Create, User)
      params.permit!
      @user = User.new(params[:user])
      if @user.save
        flash[:notice] = "Successfully created User." 
        redirect_to root_path
      else
        render :action => 'new'
      end
    else 
      redirect_to root_path
    end 
  end

  def edit
    if(can? :Edit, User)
      @user = User.find(params[:id])
    else  
      redirect_to root_path
    end 
  end

  def update
    if(can? :Update, User)
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
    else  
      redirect_to root_path
    end
  end

  private
      def user_params
        params.require(:user).permit(:email, :email_confirmation ,:first_name, :last_name, :birthday, :role, :street_and_nr, :zip_code, :state, :locality, :country_name, :password, :password_confirmation)
      end
end
