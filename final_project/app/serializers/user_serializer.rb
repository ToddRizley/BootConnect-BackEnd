class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_name, :position, :company, :bio, :email_address
  belongs_to :organization
  has_many :locations
  has_many :interests
  has_many :jobs
  has_many :articles
end
