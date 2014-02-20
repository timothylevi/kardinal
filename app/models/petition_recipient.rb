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

class PetitionRecipient < ActiveRecord::Base
  attr_accessible :petition_id, :recipient_id

  validates :petition_id, :recipient_id, presence: true

  belongs_to :petition
  belongs_to :recipient
end
