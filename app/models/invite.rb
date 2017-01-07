class Invite < ActiveRecord::Base


validates :sender_comment, length: { maximum: 255 }, :allow_blank => true, presence: {message: "unzulässiges format"}
validates :recipient_comment, length: { maximum: 255 }, :allow_blank => true, presence: {message: "unzulässiges format"}
validates :event_id, :presence => true
validates :sender_id, :presence => true
validates :recipient_id, :presence => true


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
