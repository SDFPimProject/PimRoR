class Event < ActiveRecord::Base

    scope :by_user_id, -> (user_id) do
      user_id_string = "user_id = " + user_id.to_s
      where("creator = ?", user_id_string)
    end

    def as_json(options = {})
    {
      :title => self.title,
      :start => self.start_time,
      :end => self.end_time,
      :description => self.description
     }
     end


end
