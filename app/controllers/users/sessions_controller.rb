class< Devise::SessionsController
  after_filter :after_login, :only => :create
  after_filter :after_logout, :only => :destroy

  def after_login
    puts('LOGIN')
    user = User.find(current_user.id)
    user.connection_id="LOGIN"
    user.save!
  end

  def after_logout
    puts('LOGOUT');
  end
end
