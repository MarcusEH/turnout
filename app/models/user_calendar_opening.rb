class UserCalendarOpening < ApplicationRecord
  belongs_to :user
  # validate :begin_time_is_valid_datetime
  # validate :end_time_is_valid_datetime
  # validate :validate_end_after_begin_time

  # def begin_time_is_valid_datetime
  #   errors.add(:begin_time, 'must be a valid date and time') if ((DateTime.parse(begin_time.to_s) rescue ArgumentError) == ArgumentError)
  # end

  # def end_time_is_valid_datetime
  #   errors.add(:end_time, 'must be a valid date and time') if ((DateTime.parse(end_time.to_s) rescue ArgumentError) == ArgumentError)
  # end

  # def validate_end_after_begin_time
  #   if (begin_time > end_time)
  #     errors[:base] << "Begin time must be before end time!"
  #   end
  # end

  def begin_formatted_time
    begin_time.strftime("%A, %d %b %Y %l:%M %p")
  end

  def end_formatted_time
    end_time.strftime("%A, %d %b %Y %l:%M %p")
  end
end
