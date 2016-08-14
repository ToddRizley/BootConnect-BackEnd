class JobSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :url
  belongs_to :user
  belongs_to :location
end
