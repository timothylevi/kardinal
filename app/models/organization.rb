class Organization < ActiveRecord::Base
  validates :name, :user_id, :head_id, presence: true

  belongs_to :user
end
