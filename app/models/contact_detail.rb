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
#

class ContactDetail < ActiveRecord::Base
  attr_accessible :street_address, :city, :state,
                  :zip, :phone, :country, :birthday,
                  :twitter_id, :facebook_id, :contact_form,
                  :description, :website, :contactable_id,
                  :contactable_type

  validates :zip, presence: true
  # validates :contactable_id, :contactable_type, presence: true

  belongs_to :contactable, polymorphic: true

  def self.list_states
    %w(-- AL AK AZ AR CA CO CT DE DC FL GA HI ID IL IN IA KS KY
          LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH
          OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY PR AS GU
          MP VI UM FM PW)
  end
end
