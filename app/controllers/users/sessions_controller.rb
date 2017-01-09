class Users::SessionsController < Devise::SessionsController
  after_filter :after_login, :only => :create
  after_filter :after_logout, :only => :destroy

  def after_login
    flash[:success] = t('session.hey') + current_user.first_name + t('session.welcome')
  end

  def after_logout
  end
end
