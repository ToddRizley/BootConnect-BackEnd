require 'rails_helper'
##note fix organization association
describe Location do
  user1 = User.create(name: "Jane Banks")
  user2 = User.create(name: "Michael Banks")
  org1 = Organization.create(name: "The Bank")
  org2 = Organization.create(name: "The Other Bank")
  job1 = Job.create(title: "Banker")
  job2 = Job.create(title: "Nanny")
  # OrganizationLocation.create(organization_id: org1.id, location_id: location.id)
  # OrganizationLocation.create(organization_id: org2.id, location_id: location.id)


  let!(:location) {Location.create(
    :street => "17 Cherry Tree Lane",
    :city => "City of London",
    :state => "London",
    :zipcode => "12482",
    :users => [user1, user2],
    # :organizations => [org1, org2],
    :jobs => [job1, job2]
    )
  }


  it "it has a street" do
      expect(location.street).to eq("17 Cherry Tree Lane")
  end

  it "it has a city" do
      expect(location.city).to eq("City of London")
  end

  it "it has a state" do
    expect(location.state).to eq("London")
  end

  it "it has a zipcode" do
    expect(location.zipcode).to eq(12482)
  end

  it "it has many users" do
    expect(location.users.count).to eq(2)
  end

  it "it has many organizations through organization_locations" do
    expect(location.organizations.count).to eq(2)
  end

  it "it has many jobs" do
    expect(location.jobs.count).to eq(2)
  end


end
