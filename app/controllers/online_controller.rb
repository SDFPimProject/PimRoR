class OnlineController < WebsocketRails::BaseController
  include NotificationsHelper

  def new_connection
    user = User.find(current_user.id)
    #Prüfung ob neuer Login / bbzw. die Seite geschlossen und wieder geöffnet
    if user.connection_id == '' && (Time.now - user.updated_at) > 3
      #Wenn Ja Notification zum Client
      notification_to_user(user.id,{
          :message => "Hey, " + user.first_name + "!\nWillkommen bei PIMSuite+.",
          :type => 'success'
      })
    end
    user.update_attribute(:connection_id, client_id)
  end

  def close_connection
    user = User.find(current_user.id)
    user.update_attribute(:connection_id, '')
  end
end
