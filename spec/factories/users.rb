# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  email            :string(255)      not null
#  pw_digest        :string(255)      not null
#  name             :string(255)      not null
#  pwreset_token    :string(255)      not null
#  session_token    :string(255)      not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  activated        :string(255)      default("f")
#  activation_token :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |f|
    f.email Faker::Internet.safe_email
    f.password Faker::Internet.password
    f.name "#{Faker::Name.first_name} #{Faker::Name.last_name}"
    f.authorized false
  end
end
