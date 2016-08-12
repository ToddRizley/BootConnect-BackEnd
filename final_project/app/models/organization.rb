class Organization < ApplicationRecord
	has_many :user_organizations
	has_many :users, through: :user_organizations

  has_many :organization_location
  has_many :locations, through: :organization_location
	has_many :admins
  has_many :articles
end
