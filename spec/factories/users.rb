# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |f|
    f.email Faker::Internet.safe_email
    f.pw_digest Faker::Internet.password
    f.name "#{Faker::Name.first_name} #{Faker::Name.last_name}"
    f.authorized false
    f.pwreset_token Faker::Number.number(15)
    f.auth_token Faker::Number.number(15)
    f.session_token Faker::Number.number(15)
  end
end
