require 'factory_girl_rails'
require 'faker'

User.destroy_all
Article.destroy_all
Admin.destroy_all
Location.destroy_all
Organization.destroy_all
Interest.destroy_all
Job.destroy_all



# create organizations
20.times do
  FactoryGirl.create :organization, name: Faker::University.name
end

#create interests
20.times do
  FactoryGirl.create(:interest,
    name: Faker::Hipster.word,
    description: Faker::Hipster.paragraph
    )
end

#create jobs
20.times do
  FactoryGirl.create(:job,
    title: Faker::Name.title,
    description: Faker::Hipster.sentence,
    url: Faker::Internet.url
    )
end

#create locations
20.times do
  FactoryGirl.create(:location,
    name: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zipcode: Faker::Address.zip_code
    )
end

#create users
20.times do
  FactoryGirl.create(:user,
    name: Faker::StarWars.character,
    user_name: Faker::Internet.user_name,
    position: Faker::Name.title,
    company: Faker::Company.name,
    bio: Faker::Hipster.paragraph,
    email_address: Faker::Internet.email,
    organization_id: rand(1..20)
    )
end

#create admins
10.times do
  FactoryGirl.create(:admin,
    name: Faker::Name.name
    )
end

#create articles
20.times do
  FactoryGirl.create(:article,
    title: Faker::Book.title,
    url: Faker::Internet.url
    )
end

##create user location associations
Location.all.each do |loc|
  User.all.each do |user|
    loc.users << user
    user.locations << loc
  end
end

##create org/admin associations
Admin.all.each do |admin|
  Organization.all.each do |org|
    admin.organization = org
    org.admins << admin
  end
end

##create article/users associations
Article.all.each do |art|
  User.all.each do |user|
    user.articles << art
    art.user = user
  end
end

##create interest/user associations

Interest.all.each do |interest|
  User.all.each do |user|
    interest.users << user
    user.interests << interest
  end
end

##create job/user associations
Job.all.each do |job|
  User.all.each do |user|
    job.user = user
    user.jobs << job
  end
end

#create job/location association
Job.all.each do |job|
  Location.all.each do |loc|
    job.location = loc
    loc.jobs << job
  end
end

##create organization/location associations

Location.all.each do |loc|
  Organization.all.each do |org|
    org.locations << loc
    loc.organizations << org
  end
end

##create org/user association
Organization.all.each do |org|
  User.all.each do |user|
    org.users << user
    user.organization = org
  end
end
