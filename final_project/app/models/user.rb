class User < ApplicationRecord
  has_many :user_interests
  has_many :interests, through: :user_interests

  has_many :user_locations
  has_many :locations, through: :user_locations

  has_many :jobs
  has_many :articles

  belongs_to :organization, optional: true

end
