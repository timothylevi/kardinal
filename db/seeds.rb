# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do |i|
  User.create(email: Faker::Internet.safe_email,
              password: Faker::Internet.password,
              name: Faker::Name.name)
end

User.all.each do |user|
  user.contact_details.create(
    street_address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Address.zip[0..4],
    phone: Faker::PhoneNumber.phone_number,
    country: "United States",
    description: Faker::Lorem.paragraph(6),
    website: Faker::Internet.url)
end

i = User.first.id

while i < User.last.id do
  if (i % 3 == 0)
    user = User.find(i)
    user.petitions.create(
      title: Faker::Company.catch_phrase,
      body: Faker::Lorem.paragraph(3),
      background: Faker::Lorem.paragraph(6))
  end

  i += 1
end