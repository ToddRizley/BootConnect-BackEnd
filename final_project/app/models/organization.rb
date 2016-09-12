class Organization < ApplicationRecord
	has_many :users
  has_many :location_organizations
  has_many :locations, through: :location_organizations
	has_many :admins
end
