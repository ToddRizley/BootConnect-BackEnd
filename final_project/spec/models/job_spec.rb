require 'rails_helper'

User.destroy_all
Article.destroy_all
Admin.destroy_all
Location.destroy_all
Organization.destroy_all
Interest.destroy_all
Job.destroy_all



describe Job do
  user1 = User.create(name: "Walter White", email_address: "1whoknocks@meth.com")
  location = Location.create(city: "ABQ")

  let!(:job) {Job.create(
    :title => "Chemist",
    :description => "Teach highschoolers by day, cook meth by night!",
    :url => "www.lospolloshermanos.com",
    :user_id => user1.id,
    :location_id => location.id
    )
  }

  it "it has a title" do
      expect(job.title).to eq("Chemist")
  end

  it "it has a description" do
      expect(job.description).to eq("Teach highschoolers by day, cook meth by night!")
  end

  it "it belongs to a user" do
    expect(job.user.name).to eq("Walter White")
  end

  it "it belongs to a location" do
    expect(job.location.city).to eq("ABQ")
  end

end
