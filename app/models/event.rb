class Event < ActiveRecord::Base

    scope :by_user_id, -> (user_id) do
      where("creator_id = ?", user_id)
    end
end
