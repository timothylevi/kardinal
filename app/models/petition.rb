# == Schema Information
#
# Table name: petitions
#
#  id         :integer          not null, primary key
#  creator_id :integer          not null
#  title      :string(255)      not null
#  body       :text             not null
#  background :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  approved   :string(255)      default("Pending")
#  goal       :integer
#

class Petition < ActiveRecord::Base
  attr_accessible :title, :body, :background

  validates :creator_id, :title, :body, :background, presence: true
  validates :title, uniqueness: true
  validates :approved, inclusion: {in: %w(Approved Pending Denied)}

  belongs_to :creator,
    class_name: "User",
    foreign_key: :creator_id,
    primary_key: :id

  has_many :petition_signatures

  has_many :signatures, through: :petition_signatures, source: :user
end
