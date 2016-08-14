class LocationOrganization < ApplicationRecord
  belongs_to :location
  belongs_to :organization
end
