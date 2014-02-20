# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Congress.key = "676f1c6b8413438eab6c84708c2a69a4"

# 100.times do |i|
#   User.create!(email: Faker::Internet.safe_email,
#               password: "password",
#               name: Faker::Name.name)
# end
#
# User.all.each do |user|
#   user.contact_details.create!(
#     street_address: Faker::Address.street_address,
#     city: Faker::Address.city,
#     state: Faker::Address.state_abbr,
#     zip: Faker::Address.zip[0..4],
#     phone: Faker::PhoneNumber.phone_number,
#     country: "United States",
#     description: Faker::Lorem.paragraph(6),
#     website: Faker::Internet.url)
# end
#
# i = User.first.id
#
# while i < User.last.id do
#   if (i % 3 == 0)
#     user = User.find(i)
#     user.petitions.create!(
#       title: Faker::Company.catch_phrase,
#       body: Faker::Lorem.paragraph(3),
#       background: Faker::Lorem.paragraph(6))
#   end
#
#   i += 1
# end
#
# 1000.times do
#   j = rand(User.first.id..User.last.id)
#   k = rand(Petition.first.id..Petition.last.id)
#   unless PetitionSignature.find_single(j, k)
#     PetitionSignature.create!(user_id: j, petition_id: k)
#   end

legislators = Congress.legislators(per_page: "all")[:results]

legislators.each do |legislator|
  recipient = Recipient.create!(
    title: legislator[:title],
    first_name: legislator[:first_name],
    middle_name: legislator[:middle_name],
    last_name: legislator[:last_name],
    bioguide_id: legislator[:bioguide_id],
    gov_state: legislator[:state],
    office: legislator[:office],
    party: legislator[:party])

  recipient.contact_details.create!(
    phone: legislator[:phone],
    birthday: legislator[:birthday],
    website: legislator[:website],
    contact_form: legislator[:contact_form],
    twitter_id: legislator[:twitter_id],
    facebook_id: legislator[:facebook_id],
    zip: "xxxxx"
  )
end