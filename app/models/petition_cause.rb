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

class PetitionCause < ActiveRecord::Base
  attr_accessible :petition_id, :cause_id

  validates :petition_id, :cause_id, presence: true

  belongs_to :petition
  belongs_to :cause
end
