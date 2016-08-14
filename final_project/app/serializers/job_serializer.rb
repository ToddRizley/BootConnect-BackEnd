class JobSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_many: :users
end
