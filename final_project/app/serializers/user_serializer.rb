class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :interests, :location, :position, :company, :bio, :email_address, :experience, :jobs, :articles
  belongs_to :organization
  belongs_to :location
  has_many :interests
  has_many :jobs
  has_many :articles
end
