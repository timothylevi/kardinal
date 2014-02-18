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
#

class ContactDetail < ActiveRecord::Base
  attr_accessible :street_address, :city, :state,
                  :zip, :phone, :country, :birthday,
                  :description, :website, :contactable_id,
                  :contactable_type

  validates :zip, :contactable_id, :contactable_type,
            presence: true

  belongs_to :contactable, polymorphic: true
end
