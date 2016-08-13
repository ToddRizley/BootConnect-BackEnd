require 'factory_girl_rails'
require 'faker'



#users
FactoryGirl.define do
  factory :user do
    name Faker::StarWars.character ##Name.name
    user_name Faker::Internet.user_name
    position Faker::Name.title
    company Faker::Company.name
    bio Faker::Hipster.paragraph
    email_address Faker::Internet.email

  end
end

# t.integer  "organization_id" Do org associations!! for user and admin

FactoryGirl.define do
  factory :admin do
    name Faker::Name.name
  end
end

FactoryGirl.define do
  factory :article do
    title Faker::Book.title
    url Faker::Internet.url
    ##user_id
    ##org_id
  end
end

FactoryGirl.define do
  factory :interest do
    name Faker::
    description Faker::Hipster.paragraph
  end
end

FactoryGirl.define do
  factory :job do
    title Faker::Name.title
    description Faker::Hipster.sentence
    url Faker::Internet.url
    # user_id
    #location_id
  end

end

FactoryGirl.define do
  factory :location do
    name Faker::Address.street_address
    city Faker::Address.city
    state Faker::Address.state
    zipcode Faker::Address.zip_code
  end
end

FactoryGirl.define do
  factory :organization do
    name Faker::University.name
  end
end
