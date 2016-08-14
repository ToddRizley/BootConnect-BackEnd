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
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zipcode: Faker::Address.zip_code
    )
end

#create users
20.times do
  FactoryGirl.create(:user,
    name: Faker::StarWars.character,
    position: Faker::Name.title,
    company: Faker::Company.name,
    bio: Faker::Hipster.paragraph,
    email_address: Faker::Internet.email
    )
end

#create admins
10.times do
  FactoryGirl.create(:admin,
    name: Faker::Name.name,
    email_address: Faker::Internet.email
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
  random_users = User.all.sample(2)
  loc.users = random_users
  random_users.each { |user| user.locations << loc }
end

##create admin/org associtation
Admin.all.each_with_index do |admin, idx|
  org = Organization.all[idx]
  admin.organization = org
  org.admins << admin
end

##create article/user association
Article.all.each do |art|
  user = User.all.sample
  user.articles << art
  art.user = user
end

##create interest/user association
Interest.all.each do |interest|
  user = User.all.sample
  interest.users << user
end

##create job/user assocation
Job.all.each do |job|
  user = User.all.sample
  user.jobs << job
  job.user = user
end

#create job/location association
Job.all.each do |job|
  loc = Location.all.sample
  loc.jobs << job
  job.location = loc
end

##create organization/location associations
Location.all.each do |loc|
  org = Organization.all.sample
  org.locations << loc
  loc.organizations << org
end

##create org/user association
Organization.all.each do |org|
  user = User.all.sample
  org.users << user
  user.organization = org
end
