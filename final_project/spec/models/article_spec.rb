require 'rails_helper'
require 'pry'

User.destroy_all
Article.destroy_all

User.destroy_all
Article.destroy_all
Admin.destroy_all
Location.destroy_all
Organization.destroy_all
Interest.destroy_all
Job.destroy_all

describe Article do
  user = User.create(name: "Indiana Jones", email_address: "indy@lucasarts.com")

  let!(:article) {Article.create(
    :title => "It's A Trap!",
    :url => "www.askjeeves.com",
    :user_id => user.id
    )
  }

  it "it has a title" do
      expect(article.title).to eq("It's A Trap!")
  end

  it "it has an url" do
      expect(article.url).to eq("www.askjeeves.com")
  end

  it "it belongs to a user" do
    expect(article.user.name).to eq("Indiana Jones")
  end


end
