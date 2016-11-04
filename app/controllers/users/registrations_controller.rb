class Users::RegistrationsController < Devise::RegistrationsController

    def create
      
    build_resource
    resource.role = "user"

    if resource.save
      if resource.active?
        set_flash_message :notice, :signed_up
        sign_in_and_redirect(resource_name, resource)
      else
        set_flash_message :notice, :inactive_signed_up, :reason => resource.inactive_message.to_s
        expire_session_data_after_sign_in!
        redirect_to after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords(resource)
      render_with_scope :new
    end
  end

  def token
    #@user = User.where(:id => params[:user_id]).first
    #@user.reset_authentication_token!
    redirect_to edit_user_registration_path(@user)
  end

   def edit
     
   end

   def update
     @user = User.find(current_user.id)
     
     if  account_update_params[:password].blank?
         @user.update_without_password(account_update_params)
         set_flash_message :notice, :updated
          redirect_to after_update_path_for(@user)
    else if  @user.update(account_update_params)
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end
  end

  def account_update_params 
    params.require(:user).permit(:email, :role, :password, :password_confirmation) 
  end 

end
