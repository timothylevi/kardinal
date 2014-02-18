# == Schema Information
#
# Table name: petitions
#
#  id         :integer          not null, primary key
#  creator_id :integer          not null
#  title      :string(255)      not null
#  body       :text             not null
#  background :text             not null
#  approved   :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Petition < ActiveRecord::Base
  attr_accessible :title, :body, :background

  validates :creator_id, :title, :body, :background, presence: true
  validates :title, uniqueness: true

  belongs_to :creator,
    class_name: "User",
    foreign_key: :creator_id,
    primary_key: :id
end