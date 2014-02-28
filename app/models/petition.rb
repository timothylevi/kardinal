# == Schema Information
#
# Table name: petitions
#
#  id                 :integer          not null, primary key
#  creator_id         :integer          not null
#  title              :string(255)      not null
#  body               :text             not null
#  background         :text             not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  approved           :string(255)      default("Pending")
#  goal               :integer
#  is_victory         :boolean          default(FALSE)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Petition < ActiveRecord::Base
  attr_accessible :title, :body, :background, :is_victory, :image,
                  :recipient_ids, :approved, :goal, :cause_ids

  before_validation :ensure_goal

  has_attached_file :image, :styles => {
                      :profile => "300x200#",
                      :thumbnail => "37.5x25#"},
    :default_url => "https://s3.amazonaws.com/changeorg_clone_dev/petition_default_:style.png"

  validates :title, :body, :background, :goal, presence: true
  # validates :title, uniqueness: true
  validates :approved, inclusion: {in: %w(Approved Pending Denied)}

  belongs_to :creator,
    class_name: "User",
    foreign_key: :creator_id,
    primary_key: :id

  has_many :petition_signatures, dependent: :destroy
  has_many :petition_recipients, dependent: :destroy
  has_many :petition_causes, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  has_many :recipients, through: :petition_recipients, source: :recipient
  has_many :supporters, through: :petition_signatures, source: :user
  has_many :causes, through: :petition_causes, source: :cause

  has_one :victory, dependent: :destroy

  paginates_per 10

  def ensure_goal
    self.goal ||= 100
  end
end
