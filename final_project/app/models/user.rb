class User < ApplicationRecord
  has_many :user_interests
  has_many :interests, through: :user_interests

	has_many :user_locations
  has_many :locations, through: :user_locations

  has_many :jobs
  has_many :articles

  belongs_to :organization

  #class methods 

  def self.find_by_interest(user_interest)
  	User.all.find_by(interest: user_interest)
  end

  def self.find_by_location(user_location)
  	User.all.find_by(location: user_location)
  end

  def self.interests_by_location(target_location, target_interest)
  	users_at_location = User.all.find_by(location: user_location)
  	users_with_target_interest = users.find_by(interest: target_interest)
  end

  #instance methods

  def initialize
  	banned = false
  end

  def user_since
  	self.created_at.strftime("User since %m/%d/%Y ")
  end

 	def banned=(condition)
 		self.banned = condition	
 	end

 	def make_admin
 	end

end
