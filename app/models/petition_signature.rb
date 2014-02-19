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

class PetitionSignature < ActiveRecord::Base
  attr_accessible :user_id, :petition_id

  validates :user_id, :petition_id, presence: true

  belongs_to :user
  belongs_to :petition
end