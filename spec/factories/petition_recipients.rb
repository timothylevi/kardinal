# == Schema Information
#
# Table name: petition_recipients
#
#  id           :integer          not null, primary key
#  petition_id  :integer          not null
#  recipient_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :petition_recipient do
  end
end
