class User < ApplicationRecord
	has_many :user_organizations
	has_many :organizations, through: :user_organizations

  has_many :user_interests
  has_many :interests, through: :user_interests

  has_many :user_locations
  has_many :locations, through: :user_locations

  has_many :jobs
  has_many :articles

  belongs_to :location
end
