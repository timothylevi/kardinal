# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |f|
    f.email Faker::Internet.safe_email
    f.password Faker::Internet.password
    f.name "#{Faker::Name.first_name} #{Faker::Name.last_name}"
    f.authorized false
  end
end
