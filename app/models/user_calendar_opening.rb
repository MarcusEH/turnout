class UserCalendarOpening < ApplicationRecord
  def begin_formatted_time
    begin_time.strftime("%A, %d %b %Y %l:%M %p")
  end

  def end_formatted_time
    end_time.strftime("%A, %d %b %Y %l:%M %p")
  end

end
