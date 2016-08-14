require 'rails_helper'

describe Admin do
  organization = Organization.create(name: "Dunder Mifflin")

  let!(:admin) {Admin.create(
    :name => "Fred Savage",
    :organization_id => organization.id
    )
  }

  it "it has a name" do
      expect(admin.name).to eq("Fred Savage")
  end

  it "it belongs to an organization" do
      expect(admin.organization.name).to eq("Dunder Mifflin")
  end



end
