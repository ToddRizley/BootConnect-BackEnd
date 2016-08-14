class Location < ApplicationRecord
  has_many :user_locations
  has_many :users, through: :user_locations

  has_many :location_organizations
  has_many :organizations, through: :location_organizations
  has_many :jobs
end
