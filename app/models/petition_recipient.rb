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
  #attr_accessible :petition_id, :recipient_id

  validates :petition_id, :recipient_id, presence: true

  belongs_to :petition
  belongs_to :recipient

  def self.find_single(recipient_id, petition_id)
    PetitionRecipient.find_by_recipient_id_and_petition_id(recipient_id, petition_id)
  end

end
