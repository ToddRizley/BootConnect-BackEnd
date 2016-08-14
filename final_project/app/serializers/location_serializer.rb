class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :state, :zipcode
  has_many :users
  has_many :organizations
  has_many :jobs
end



class Location < ApplicationRecord
  has_many :user_locations
  has_many :users, through: :user_locations

  has_many :organization_locations
  has_many :organizations, through: :organization_locations

  has_many :jobs
end

create_table "locations", force: :cascade do |t|
  t.string  "name"
  t.string  "city"
  t.string  "state"
  t.integer "zipcode"
end
