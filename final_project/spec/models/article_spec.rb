require 'rails_helper'


describe Article do
  user = User.create(name: "Indiana Jones")

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
