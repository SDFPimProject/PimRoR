module NotificationsHelper
  def notification_to_user(userid, options)
    WebsocketRails[userid].trigger('new_notification', options);
  end

  def notification_to_all(options)
    WebsocketRails[:all].trigger('new_notification', options);
  end
end
