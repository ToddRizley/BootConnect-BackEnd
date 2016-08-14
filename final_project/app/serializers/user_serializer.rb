class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :position, :company, :bio, :email_address
  belongs_to :organization
  has_many :locations
  has_many :interests
  has_many :jobs
  has_many :articles
end
