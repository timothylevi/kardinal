# == Schema Information
#
# Table name: recipients
#
#  id          :integer          not null, primary key
#  title       :string(255)      not null
#  first_name  :string(255)      not null
#  middle_name :string(255)
#  last_name   :string(255)
#  bioguide_id :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Recipient < ActiveRecord::Base
  attr_accessible :title, :first_name, :middle_name, :last_name,
                  :bioguide_id, :contact_details

  has_many :contact_details, as: :contactable, dependent: :destroy
end
