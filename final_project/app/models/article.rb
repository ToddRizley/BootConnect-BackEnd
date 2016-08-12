class Article < ApplicationRecord
  belongs_to :user, optional: true
  # belongs_to :organization, through: :users
end
