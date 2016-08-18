class LocationSerializer < ActiveModel::Serializer
  attributes :id, :city, :state
  has_many :users
  has_many :organizations
  has_many :jobs
end
