class User < ApplicationRecord
  has_many :user_interests
  has_many :interests, through: :user_interests

	has_many :user_locations
  has_many :locations, through: :user_locations

  has_many :jobs
  has_many :articles

  belongs_to :organization, optional: true

  #name, email, password, confirm password
  validates :name, :user_name,  presence: true
  
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_format_of :email_address, with: EMAIL_REGEX, :on => :create
  validates :email_address, uniqueness: true
  #has_secure_password
end
