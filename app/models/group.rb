class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :group_events

  def find_opening
  #   time_range = 
    @begin_time = "1111-11-11T11:11:11"
    @end_time = "1111-11-11T11:11:11"
    self.users.each do |user1|
      self.users.each do |user2|
        user1.user_calendar_openings.each do |opening_user1|
          user2.user_calendar_openings.each do |opening_user2|
            if (opening_user1.begin_time < opening_user2.end_time) && (opening_user2.begin_time < opening_user1.end_time)
              @begin_time = opening_user2.begin_time
              @end_time = opening_user2.end_time
              p @end_time
            end
          end
        end
      end
    end
    p [@begin_time, @end_time]
    return [@begin_time, @end_time]
  end


 #only issue is this is not calling calendar_openings... need to also loop through that in each each loop... yeaaa

  # https://stackoverflow.com/questions/7325124/how-check-intersection-of-datetime-periods
end
