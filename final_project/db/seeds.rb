require 'factory_girl_rails'
require 'faker'

User.destroy_all
Article.destroy_all
Admin.destroy_all
Location.destroy_all
Organization.destroy_all
Interest.destroy_all
Job.destroy_all

##add associations to models!!!

# create organizations
10.times do
  FactoryGirl.create :organization, name: Faker::University.name
end

#create locations
10.times do
  FactoryGirl.create(:location,
    name: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zipcode: Faker::Address.zip_code
    )
  end
end

#create users
10.times do
  FactoryGirl.create(:user,
    name: Faker::StarWars.character,
    user_name: Faker::Internet.user_name,
    position: Faker::Name.title,
    company: Faker::Company.name,
    bio: Faker::Hipster.paragraph,
    email_address: Faker::Internet.email
    )
  end
end

#create admins
5.times do
  FactoryGirl.create(:admin,
    name: Faker::Name.name
    )
  end
end

#create articles
20.times do
  FactoryGirl.create(:article,
    title: Faker::Book.title,
    url: Faker::Internet.url
    )
  end
end

#create interests
15.times do
  FactoryGirl.create(:interest,
      name: Faker::Hipster.word,
      description: Faker::Hipster.paragraph
      )
  end
end

#create jobs

20.times do
  FactoryGirl.create(:job,
    title: Faker::Name.title,
    description: Faker::Hipster.sentence,
    url: Faker::Internet.url
    )
  end
end
