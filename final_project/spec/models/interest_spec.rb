require 'rails_helper'

User.destroy_all
Article.destroy_all
Admin.destroy_all
Location.destroy_all
Organization.destroy_all
Interest.destroy_all
Job.destroy_all

describe Interest do
  user1 = User.create(name: "Indiana Jones", email_address: "snake@yikes.com")
  user2 = User.create(name: "Doc Brown", email_address: "bttf@greatscott.com")

  let!(:interest) {Interest.create(
    :name => "Hoverboarding",
    :description => "BTTF 2 is the shizz.. Biff is a butthead",
    :users => [user1, user2]
    )
  }

  it "it has a name" do
      expect(interest.name).to eq("Hoverboarding")
  end

  it "it has a description" do
      expect(interest.description).to eq("BTTF 2 is the shizz.. Biff is a butthead")
  end

  it "it has many users" do
    expect(interest.users.count).to eq(2)
  end

end
