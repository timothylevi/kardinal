# == Schema Information
#
# Table name: contact_details
#
#  id               :integer          not null, primary key
#  street_address   :string(255)
#  city             :string(255)
#  state            :string(255)
#  zip              :string(255)      not null
#  country          :string(255)
#  phone            :string(255)
#  birthday         :datetime
#  description      :text
#  contactable_id   :integer          not null
#  contactable_type :string(255)      not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  website          :string(255)
#  twitter_id       :string(255)
#  facebook_id      :string(255)
#  contact_form     :string(255)
#  desc_source      :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact_detail do
  end
end
