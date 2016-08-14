require 'rails_helper'

describe User do
  org =  Organization.create(name: "Katz Emporium of Cool Stuff")
  let!(:user) { User.create(
    :name => "Jeff Katz",
    :user_name => "katz4prez",
    :position => "Overlord",
    :company => "JKatzSuperPAC",
    :bio => "Coding thangz, breakin hartz.",
    :email_address => "canttouchdis@hotmail.com",
    :organization_id => org.id
    )
  }

  it "it has a name" do
      expect(user.name).to eq("Jeff Katz")
  end

  it "it has an user_name" do
      expect(user.user_name).to eq("katz4prez")
  end

  it "it has a position" do
      expect(user.position).to eq("Overlord")
  end

  it "it has a company" do
    expect(user.company).to eq("JKatzSuperPAC")
  end

  it "it has a bio" do
    expect(user.bio).to eq("Coding thangz, breakin hartz.")
  end

  it "it has an email address" do
    expect(user.email_address).to eq("canttouchdis@hotmail.com")
  end

  it "it belongs to an organization" do
    expect(user.organization.name).to eq("Katz Emporium of Cool Stuff")
  end



end

  # class User < ApplicationRecord
  #   has_many :user_interests
  #   has_many :interests, through: :user_interests
  #
  # 	has_many :user_locations
  #   has_many :locations, through: :user_locations
  #
  #   has_many :jobs
  #   has_many :articles
  #
  #   belongs_to :organization, optional: true
  # end
