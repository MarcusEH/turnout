class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :group_events

  # def find_opening
  #   time_range = 
  #   current_opening = "1111-11-11T11:11:11"
  #   @group.users.each do |user|
  #     user.user_calendar_openings.each do |user_opening|
          # if (user1.begin_time < user2.end_time) && (user2.begin_time < user1.end_time) something like this need to find a way to define who is user 1 and 2.. how to loop through grabbing two users at a time.. nested loops? idk.
  #       time_range = user_opening.begin_time..user_opening.end_time
  #     end
  #   end
  # end
  # https://stackoverflow.com/questions/7325124/how-check-intersection-of-datetime-periods
end
