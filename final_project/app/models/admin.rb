class Admin < ApplicationRecord
  belongs_to :organization, optional: true
end
