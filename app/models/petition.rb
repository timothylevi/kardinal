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
  attr_accessible :title, :body, :background, :recipient_ids

  validates :title, :body, :background, presence: true
  # validates :title, uniqueness: true
  validates :approved, inclusion: {in: %w(Approved Pending Denied)}

  belongs_to :creator,
    class_name: "User",
    foreign_key: :creator_id,
    primary_key: :id

  has_many :petition_signatures
  has_many :petition_recipients, dependent: :destroy

  has_many :recipients, through: :petition_recipients, source: :recipient
  has_many :supporters, through: :petition_signatures, source: :user

  has_one :victory

  def self.get_non_victories
    ids = Victory.pluck(:petition_id)
    Petition.includes(:creator, :petition_signatures).where("id NOT IN (?)", ids)
  end
end
