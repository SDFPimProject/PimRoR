class Users::UsersController < ApplicationController
  layout "settingsmenu"

  def index
        @users = User.all.order('last_name').page(params[:page])
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
        flash[:notice] = t('models.user.create') 
        redirect_to root_path
      else
        render :action => 'new'
      end
    end
  end

  def edit
    if(can? :Edit, User)
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def show
      @user = User.find(params[:id])
  end

  def update
    if(can? :Update, User)
      params.permit!
      @user = User.find(params[:id])
      params[:user].delete(:password) if params[:user][:password].blank?
      params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
      if @user.update_attributes(params[:user])
        flash[:notice] = t('models.user.update') 
        redirect_to user_index_path
      else
        render :action => 'edit'
      end
    else
      redirect_to root_path
    end
  end

  def search

    if params[:search]
      @users = User.search(params[:search]).order("first_name")
    else
      @users = User.order("first_name")
    end
    # zum behandeln von klick events auf der Suchliste
    if params[:class]
      @class = params[:class]
    else
      @class = ""
    end

    if params[:layout_type]
        render :template => 'users/users/_user_search_' + params[:layout_type] + '.html.erb', :locals => { :users => @users, :special_class => @class}, layout: false
    else
        render :template => 'users/users/_user_search.html.erb', :locals => { :users => @users, :special_class => @class}, layout: false
    end
  end

  private
      def user_params
        params.require(:user).permit(:email, :email_confirmation ,:first_name, :last_name, :birthday, :role, :street_and_nr, :zip_code, :state, :locality, :country_name, :password, :password_confirmation)
      end
end
