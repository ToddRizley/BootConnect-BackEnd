class Location < ApplicationRecord
  has_many :users
  has_many :location_organizations
  has_many :organizations, through: :location_organizations
  has_many :jobs
end
