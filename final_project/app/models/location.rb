class Location < ApplicationRecord
  has_many :user_locations
  has_many :users, through: :user_locations

  has_many :organization_locations
  has_many :organizations, through: :organization_locations

  has_many :jobs


  def rally_all_workers
  	self.Users.all
  end
end
