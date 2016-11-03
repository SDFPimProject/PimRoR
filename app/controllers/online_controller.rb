class OnlineController < WebsocketRails::BaseController
  include NotificationsHelper

  def new_connection
    user = User.find(current_user.id)
    #Prüfung ob neuer Login / bbzw. die Seite geschlossen und wieder geöffnet
    if (user.connection_id == 'LOGIN') || (user.connection_id == '' && (Time.now - user.updated_at) > 3)
      #Wenn Ja Notification zum Client
      notification_to_user(user.id,{
          :message => "Hey, " + user.first_name + " ! Willkommen bei PIMSuite.",
          :type => 'success'
      })
    end
    user.connection_id=client_id
    user.save!
  end

  def close_connection
    user = User.find(current_user.id)
    user.connection_id=''
    user.save!
  end
end
