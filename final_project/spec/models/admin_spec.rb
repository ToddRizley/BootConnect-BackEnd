require 'rails_helper'

User.destroy_all
Article.destroy_all
Admin.destroy_all
Location.destroy_all
Organization.destroy_all
Interest.destroy_all
Job.destroy_all

describe Admin do
  organization = Organization.create(name: "Dunder Mifflin")

  let!(:admin) {Admin.create(
    :name => "Fred Savage",
    :email_address => "childstar@faded.com",
    :organization_id => organization.id
    )
  }

  it "it has a name" do
      expect(admin.name).to eq("Fred Savage")
  end

  it "it has a email address" do
      expect(admin.email_address).to eq("childstar@faded.com")

  end

  it "it belongs to an organization" do
      expect(admin.organization.name).to eq("Dunder Mifflin")
  end

end
