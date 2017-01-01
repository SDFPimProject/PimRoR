class SubscribeCalendarController < ApplicationController
layout "settingsmenu"

  def index
  @users=User.all.page(params[:page])
  end

  def subscribe
   @selectedUser = User.find(params[:id])
   @user=current_user
   if(!@user.subscribtions.exists?(calendar_id: @selectedUser.id))
       @sub= @user.subscribtions.create(calendar_id: @selectedUser.id, name:@selectedUser.first_name + ' '+ @selectedUser.last_name)

           flash[:notice] = "Kalender erfolgreich abonniert."
           redirect_to :action => 'index'
        
      else
       flash[:notice] = "Kalender bereits abonniert."
       redirect_to :action => 'index'
      end
  end

 def show
 end

 def delete
   @user=current_user
   if(@user.subscribtions.exists?(calendar_id: params[:id]))
    @sub= @user.subscribtions.where("calendar_id = (?)", params[:id])
    @user.subscribtions.destroy(@sub)
     flash[:notice] ="Kalender nicht mehr abonniert"
     redirect_to :action => 'index'
    else
    flash[:notice] ="Kalender nicht abonniert"
    redirect_to :action => 'index'
    end
  end
end
