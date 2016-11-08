class Users::SessionsController < Devise::SessionsController
  after_filter :after_login, :only => :create
  after_filter :after_logout, :only => :destroy

  def after_login
    flash[:success] = "Hey, " + current_user.first_name + "! Willkommen bei PIMSuite+."
  end

  def after_logout
  end
end
