Models

User
  name
  user_name
  job
  company
  location
  bio
  image
  email_address
  ##has many organizations
  ##has many interests



UserOrganizations
  user_id
  organization_id

UserInterests
  user_id
  interest_id

Interests
  ##have many users
  name
  description

Organization
 ##has many users
 name
 industry (drop down for type)
 website
 logo
 location (HQ?)
