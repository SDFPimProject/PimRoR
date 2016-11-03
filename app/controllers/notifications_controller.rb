class NotificationsController < WebsocketRails::BaseController
  include NotificationsHelper

  def push_to_all
    notification_to_all({
        :message => data[:message],
        :type => 'info'
    })
  end
end
