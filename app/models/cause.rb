# == Schema Information
#
# Table name: causes
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :string(255)
#

class Cause < ActiveRecord::Base
  attr_accessible :name, :description

  validates :name, presence: true

  has_many :petition_causes
  has_many :petitions, through: :petition_causes, source: :petition
end
