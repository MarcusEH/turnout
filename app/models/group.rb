class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :group_events
  has_many :user_interests, through: :users

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

  def find_category
    p "*" * 50
    sum_sports = [0, "sports"]
    sum_movies = [0, "movies"]
    sum_music = [0, "music"]
    sum_food = [0, "food"]
    sum_special = [0, "special"]
    sum_custom = [0, "custom"]
    # sums = {"sports" => 0, "movies" => 0, "music" => 0, "food" => 0, "special" => 0, "custom" => 0}
    self.user_interests.each do |interest|
      if interest.category == "sports"
        sum_sports[0] += interest.interest_level
      elsif interest.category == "movies"
        sum_movies[0] += interest.interest_level
      elsif interest.category == "music"
        sum_music[0] += interest.interest_level
      elsif interest.category == "food"
        sum_food[0] += interest.interest_level 
      elsif interest.category == "special"
        sum_special[0] += interest.interest_level
      elsif interest.category == "custom"
        sum_custom[0] += interest.interest_level
      end
      
    end
    interests_array = [sum_sports, sum_movies, sum_music, sum_food, sum_special, sum_custom]
    p interests_array
    p "*" * 60
    index = 0
    event_type = ""
    final_sum = 0
    interests_array.each do |sum| 
      
      if final_sum < sum[0]
        event_type = interests_array[index][1]
        
      end
      index += 1
    end
    p event_type
    return event_type
  end 
end
