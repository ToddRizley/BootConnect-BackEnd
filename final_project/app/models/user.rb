class User < ApplicationRecord
  require 'bcrypt'
  has_many :user_interests
  has_many :interests, through: :user_interests
  belongs_to :location, optional: true

  has_many :jobs
  has_many :articles

  belongs_to :organization, optional: true

  #name, email, password_digest
  # validates :name,  presence: true
  # #
  # EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  # validates :email_address, presence: true
  # validates_format_of :email_address, with: EMAIL_REGEX, :on => :create
  # validates :email_address, uniqueness: true
  # has_secure_password


def update_name(params)
  if params["name"]
    self.name = params["name"]
  end
end

def update_location(params)
  if params["location"]
    parsed_city = params["location"].split(',')[0]
    parsed_state = params["location"].split(',')[1]
    location = Location.find_or_create_by(city: parsed_city)
    location.users << self
    location.save
  end
end

def update_bio(params)
  if params["bio"]
    self.bio = params["bio"]
  end
end

def update_position(params)
  if params["position"]
    self.position = params["position"]
  end
end

def update_company(params)
  if params["company"]
    self.company = params["company"]
  end
end

def update_email(params)
  if params["email_address"]
    self.email_address= params["email_address"]
  end
end

def update_experience(params)
  if params["experience"]
    self.experience= params["experience"]
  end
end

def update_profile(params)
  update_name(params)
  update_bio(params)
  update_position(params)
  update_company(params)
  update_email(params)
  update_experience(params)
  update_location(params)
end

end
