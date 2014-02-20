# == Schema Information
#
# Table name: recipients
#
#  id          :integer          not null, primary key
#  title       :string(255)      not null
#  first_name  :string(255)      not null
#  middle_name :string(255)
#  last_name   :string(255)
#  bioguide_id :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  gov_state   :string(255)
#  office      :string(255)
#  party       :string(255)
#

class Recipient < ActiveRecord::Base
  attr_accessible :title, :first_name, :middle_name, :last_name,
                  :bioguide_id, :gov_state, :office, :party, :contact_details

  validates :title, :first_name, :last_name, :gov_state, presence: true

  has_many :contact_details, as: :contactable, dependent: :destroy
  has_many :petition_recipients, dependent: :destroy

  has_many :petitions, through: :petition_recipients, source: :petition

  def self.list_titles
    %w(Mr Ms Mx Sen Rep Del Com)
  end

  def list_name
    return "#{self.gov_state} #{self.title}. #{self.first_name} #{self.last_name}"
  end
end
