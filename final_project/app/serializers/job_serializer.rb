class JobSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :url, :location, :company
  belongs_to :user
  belongs_to :location
end
