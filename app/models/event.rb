class Event < ActiveRecord::Base

    scope :by_user_id, -> (user_id) do
      where("creator_id = ?", user_id)
    end

    scope :by_user_id_no_deleted, -> (user_id) do
        where("(creator_id = ? OR id IN(SELECT event_id FROM invites WHERE recipient_id = ? AND recipient_status = 1))
                AND deleted = 0", user_id, user_id)
    end

    #scope :by_user_id_no_deleted_and invites, -> (user_id) do
    #    where("(creator_id = ? OR id IN(SELECT event_id FROM invites WHERE recipient_id = ? AND recipient_status = 1))
    #            AND deleted = 0", user_id, user_id)
    #end

    def as_json(options = {})
    {
      :title => self.title,
      :start => self.start_time,
      :end => self.end_time,
      :description => self.description
     }
     end


end
