# == Schema Information
#
# Table name: petition_causes
#
#  id          :integer          not null, primary key
#  petition_id :integer          not null
#  cause_id    :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :petition_cause do
  end
end
