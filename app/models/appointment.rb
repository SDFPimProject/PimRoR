class Appointment < ActiveRecord::Base
    belongs_to :user, :foreign_key => :user_id, class_name: 'User'

    def self.number_of_days_in_month(month = Time.now.month, year = Time.now.year)
       days_in_month = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
       if month == 2 && Date.gregorian_leap?(year)
           return 29
       else
           return days_in_month[month]
       end
    end

    def self.start_day_of_month(month = Time.now.month, year = Time.now.year)
        wday = Date.new(year, month, 1).wday
        if wday == 0
            return 6
        else
            return wday - 1
        end
    end

    def self.get_name_of_month(month)
        return Date::MONTHNAMES[month]
    end

    scope :by_day_month_and_year, -> (user_id, day, month, year) do
      where("appointments.user_id = ? AND appointments.day = ?
             AND appointments.month = ? AND appointments.year = ?", user_id, day, month, year)
    end

end
