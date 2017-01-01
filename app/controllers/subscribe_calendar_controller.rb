class SubscribeCalendarController < ApplicationController
layout "settingsmenu"

  def index
  @users=User.all.page(params[:page])
  end

  def subscribe
   @selectedUser = User.find(params[:id])
   @user=current_user
   if(!@user.subscribtions.exists?(calendar_id: @selectedUser.id))
       @sub= @user.subscribtions.create(calendar_id: @selectedUser.id, name:@selectedUser.first_name);
       @sub.save
       @user.save

       if(@sub.save)

           flash[:notice] = "Kalender erfolgreich abonniert."
           redirect_to :action => 'index'
         end
      else
       flash[:notice] = "Kalender bereits abonniert."
       redirect_to :action => 'index'
      end
  end

 def show
  @users=User.all.page(params[:page])
 end

end
