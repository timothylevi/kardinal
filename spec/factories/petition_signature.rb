# == Schema Information
#
# Table name: petition_signatures
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  petition_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :petition_signature, :class => 'PetitionSignature' do
  end
end
