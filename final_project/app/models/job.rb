class Job < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :location, optional: true
end
