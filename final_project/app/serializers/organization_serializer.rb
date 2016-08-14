class OrganizationSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :users
  has_many :admins
  has_many :locations
end
