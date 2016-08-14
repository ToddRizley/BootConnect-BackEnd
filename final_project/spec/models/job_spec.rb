require 'rails_helper'

describe Job do
  user1 = User.create(name: "Walter White")
  location = Location.create(name: "ABQ")

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
    expect(job.location.name).to eq("ABQ")
  end

end
