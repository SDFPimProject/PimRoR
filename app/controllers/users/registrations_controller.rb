class Users::RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]

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
