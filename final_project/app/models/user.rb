class User < ApplicationRecord
	has_many :user_interests
	has_many :user_organizations
	has_many :organizations, through: :user_organizations
	has_many :interests, through: :user_interests
	

end
