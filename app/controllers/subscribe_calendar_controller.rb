class SubscribeCalendarController < ApplicationController
  layout "settingsmenu", :only => [:index]

  def index
    require 'will_paginate/array'
    @subs=current_user.subscribtions.all.page(params[:page])
    
    @users=User.all.order('last_name').reject { |user| @subs.exists?(calendar_id: user.id) } #dont load users, whose calendar are already in subscribtion

    @users.delete(current_user)
    @users= @users.paginate(page: params[:page], per_page: 15)
  end

  def subscribe
    @selectedUser = User.find(params[:id])
    @user=current_user

    if(!@user.subscribtions.exists?(calendar_id: @selectedUser.id))
      @sub= @user.subscribtions.create(calendar_id: @selectedUser.id, name:@selectedUser.first_name + ' '+ @selectedUser.last_name)
      flash[:notice] = t('subscribe_calendar.sucessfull_subscribed')
      redirect_to :action => 'index'
    else
      flash[:notice] = t('subscribe_calendar.already_subscribed') 
      redirect_to :action => 'index'
    end
  end

  def show
    @events = Event.by_user_id(params[:userid])
    @user= User.find_by_id(params[:userid])
    respond_to do |format| 
      format.html
      format.json { render :json => @events.as_json } 
    end
  end

  def delete
    @user=current_user
    if(@user.subscribtions.exists?(calendar_id: params[:id]))
      @sub= @user.subscribtions.where("calendar_id = (?)", params[:id])
      @user.subscribtions.destroy(@sub)
      flash[:notice] = t('subscribe_calendar.subscribtion_deleted')
      redirect_to :action => 'index'
    else
      flash[:notice] = t('subscribe_calendar.not_subscribed')
      redirect_to :action => 'index'
    end
  end
end
