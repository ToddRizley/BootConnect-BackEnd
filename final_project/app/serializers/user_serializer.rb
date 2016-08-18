class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :interests, :location, :position, :company, :bio, :email_address, :experience
  belongs_to :organization
  has_many :locations
  has_many :interests
  has_many :jobs
  has_many :articles
end
