class LocationSerializer < ActiveModel::Serializer
  attributes :id, :street, :city, :state, :zipcode
  has_many :users
  has_many :organizations
  has_many :jobs
end
