class Admin < ApplicationRecord
  belongs_to :organization, optional: true

  #name, email, password, confirm password
  # validates :name, presence: true
  #
  # EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  # validates_format_of :email_address, with: EMAIL_REGEX, :on => :create
  # validates :email_address, uniqueness: true
  # #has_secure_password
end
