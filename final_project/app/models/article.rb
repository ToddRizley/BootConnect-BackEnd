class Article < ApplicationRecord
  belongs_to :user
  belongs_to :organization, through: :user 
end

