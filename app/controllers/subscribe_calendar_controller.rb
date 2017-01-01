class SubscribeCalendarController < ApplicationController
layout "settingsmenu"

  def index
  @users=User.all.page(params[:page])
  end

  def subscribe
   @selectedUser = User.find(params[:id])
   @user=current_user
   @sub= @user.subscribtions.create(calendar_id: @selectedUser.id, name:@selectedUser.first_name);
   @sub.save
   @user.save

   if(@sub.save)

   flash[:notice] = "Kalender erfolgreich aboniert."
   redirect_to :action => 'index'
   else
   flash[:notice] = "Kalender NICHT erfolgreich aboniert."
   render root_path
   end
  end

 def show
  @users=User.all.page(params[:page])
 end

end
