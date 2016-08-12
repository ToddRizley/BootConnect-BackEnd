class Organization < ApplicationRecord
	has_many :users

  has_many :organization_locations
  has_many :locations, through: :organization_locations
	has_many :admins
# has_many :articles
end
