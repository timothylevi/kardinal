# == Schema Information
#
# Table name: victories
#
#  id          :integer          not null, primary key
#  petition_id :integer          not null
#  description :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  message     :text             not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :victory do
  end
end
