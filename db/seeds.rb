# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Congress.key = ENV["CONGRESS_KEY"]

# def create_petition(user, count)
#   count.times do |i|
#     user.petitions.create(
#     title: "#{Faker::Company.catch_phrase} #{i}",
#     body: Faker::Lorem.paragraph(3),
#     background: Faker::Lorem.paragraph(6))
#   end
# end
#
# def create_fake_victory(petition)
#   petition.create_victory(
#   description: Faker::Lorem.paragraph(1),
#   message: Faker::Lorem.paragraph(6))
# end
#
# 200.times do |i|
#   name = Faker::Name.name
#
#   User.create(email: Faker::Internet.email(name),
#               password: "password",
#               name: name)
# end
#
# User.find_in_batches do |batch|
#   batch.each do |user|
#     user.contact_details.create(
#       street_address: Faker::Address.street_address,
#       city: Faker::Address.city,
#       state: Faker::Address.state_abbr,
#       zip: Faker::Address.zip[0..4],
#       phone: Faker::PhoneNumber.phone_number,
#       country: "United States",
#       description: Faker::Lorem.paragraph(6),
#       website: Faker::Internet.url)
#
#     if (user.id % 2 == 0)
#       create_petition(user, 1)
#     elsif (user.id % 3 == 0)
#       create_petition(user, 2)
#     end
#   end
# end
#
# 10000.times do
#   j = rand(User.first.id..User.last.id)
#   k = rand(Petition.first.id..Petition.last.id)
#   unless PetitionSignature.find_single(j, k)
#     PetitionSignature.create(user_id: j, petition_id: k)
#   end
# end

legislators = Congress.legislators(per_page: "all")[:results]

legislators.each do |legislator|
  recipient = Recipient.create(
    title: legislator[:title],
    first_name: legislator[:first_name],
    middle_name: legislator[:middle_name],
    last_name: legislator[:last_name],
    bioguide_id: legislator[:bioguide_id],
    gov_state: legislator[:state],
    office: legislator[:office],
    party: legislator[:party])

  recipient.contact_details.create(
    phone: legislator[:phone],
    birthday: legislator[:birthday],
    website: legislator[:website],
    contact_form: legislator[:contact_form],
    twitter_id: legislator[:twitter_id],
    facebook_id: legislator[:facebook_id],
    zip: "xxxxx"
  )
end

# Petition.find_in_batches do |batch|
#   batch.each do |petition|
#     3.times do
#       j = rand(Recipient.first.id..Recipient.last.id)
#       k = petition.id
#
#       unless PetitionRecipient.find_single(j, k)
#         petition.petition_recipients.create(recipient_id: j)
#       end
#     end
#
#     if (petition.id % 7 == 0)
#       create_fake_victory(petition)
#     end
#   end
# end