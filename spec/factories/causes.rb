# == Schema Information
#
# Table name: causes
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cause do
  end
end
