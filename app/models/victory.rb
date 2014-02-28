# == Schema Information
#
# Table name: victories
#
#  id          :integer          not null, primary key
#  petition_id :integer          not null
#  description :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  message     :text             not null
#

class Victory < ActiveRecord::Base
  attr_accessible :message, :description

  validates :petition_id, :description, :message, presence: true
  validates :petition_id, uniqueness: true

  belongs_to :petition

  paginates_per 10
end
