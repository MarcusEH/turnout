class User < ApplicationRecord
  has_many :user_groups
  has_many :groups, through: :user_groups
  has_many :user_calendar_openings
  has_many :user_interests
  has_many :group_events, through: :groups
  has_many :comments
  has_secure_password
  validates :email, presence: true, uniqueness: true
  belongs_to :user_image, optional: true
end
