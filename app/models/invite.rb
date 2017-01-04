class Invite < ActiveRecord::Base

    scope :by_recipient_id_and_event_id, -> (recipient_id, event_id) do
      where("recipient_id = ? AND event_id = ?", recipient_id, event_id)
    end

    scope :by_sender_id, -> (sender_id) do
      where("sender_id = ?", sender_id)
    end

    scope :by_sender_id_and_event_id, -> (sender_id, event_id) do
      where("sender_id = ? AND event_id = ?", sender_id, event_id)
    end

end
