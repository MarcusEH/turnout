class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :group_events
  has_many :user_interests, through: :users
  has_many :user_calendar_openings, through: :users
  has_many :comments
  has_many :invites

  def find_opening
   
    @begin_time = "1111-11-11T11:11:11"
    @end_time = "1111-11-11T11:11:11"
    self.user_calendar_openings.each do |opening_user1|
      self.user_calendar_openings.each do |opening_user2|
        if (opening_user1.begin_time < opening_user2.end_time) && (opening_user2.begin_time < opening_user1.end_time)
          @begin_time = opening_user2.begin_time
          @end_time = opening_user2.end_time
          p @end_time
        end
      end
    end
    p [@begin_time, @end_time]
    return [@begin_time, @end_time]
  end

  def find_category
    sums = {"sports" => 0, "movies" => 0, "music" => 0, "food" => 0, "special" => 0, "custom" => 0}
    self.user_interests.each do |interest|
      sums[interest.category] += interest.interest_level
    end
    event_type = ""
    final_sum = 0
    sums.each do |key, value|
      if final_sum < value
        final_sum = value
        event_type = key
      end
    end
    return event_type
  end 
  
  def find_invites_emails
    emails = []
    self.invites.each do |invite|
      emails.push(invite["email"])
    end
    return emails
  end
end
