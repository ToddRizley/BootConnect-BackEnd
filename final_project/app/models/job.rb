class Job < ApplicationRecord
  belongs_to: user
  belongs_to: location
  belongs_to: organization
end
