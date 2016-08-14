require 'rails_helper'

describe Organization do
  user1 = User.create(name: "Batman")
  user2 = User.create(name: "Superman")
  loc1 = Organization.create(name: "Wayne Enterprise")
  loc2 = Organization.create(name: "Daily Planet")
  job1 = Job.create(title: "Business Man")
  job2 = Job.create(title: "Reporter")
  admin1 = Admin.create(name: "Joker")
  admin2 = Admin.create(name: "Penguin")
  # orgloc1 = OrganizationLocation.create(organization_id: organization.id, location_id: loc1.id)
  # orgloc2 = OrganizationLocation.create(organization_id: organization.id, location_id: loc2.id)



  let!(:organization) {Organization.create(
    :name => "Justic League",
    :users => [user1, user2],
    :admins => [admin1, admin2]
    )
  }


  it "it has a name" do
      expect(organization.name).to eq("Justic League")
  end


  it "it has many users" do
    expect(organization.users.count).to eq(2)
  end

  it "it has many locations through organization_locations" do
    expect(organization.locations.count).to eq(2)
  end

  it "it has many admins" do
    expect(organization.admins.count).to eq(2)
  end


end
