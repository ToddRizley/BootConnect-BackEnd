class Location < ApplicationRecord
  has_many :user_locations
  has_many :users, through: :user_locations

  has_many :organization_location
  has_many :locations, through: :organization_location

  has_many :jobs
end
