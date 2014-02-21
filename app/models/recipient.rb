# == Schema Information
#
# Table name: recipients
#
#  id                 :integer          not null, primary key
#  title              :string(255)      not null
#  first_name         :string(255)      not null
#  middle_name        :string(255)
#  last_name          :string(255)
#  bioguide_id        :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  gov_state          :string(255)
#  office             :string(255)
#  party              :string(255)
#  email              :string(255)
#  creator_id         :integer
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Recipient < ActiveRecord::Base
  attr_accessible :title, :first_name, :middle_name, :last_name,
                  :bioguide_id, :gov_state, :office, :party,
                  :email, :image

  has_attached_file :image, :styles => {
                      :profile => "200x200#",
                      :thumbnail => "25x25#"},
  :default_url => "https://s3.amazonaws.com/changeorg_clone_dev/default_:style.png"

  validates :title, :first_name, :last_name, :gov_state,
            :creator_id, presence: true

  has_many :contact_details, as: :contactable, dependent: :destroy
  has_many :petition_recipients, dependent: :destroy

  has_many :petitions, through: :petition_recipients, source: :petition

  belongs_to :creator, class_name: "User"

  def self.set_images
    Recipient.all.each do |recipient|

      url = "http://theunitedstates.io/images/congress/original/#{recipient.bioguide_id}.jpg"

      begin
        recipient.image = url
        recipient.save
        puts "   Saving image for #{recipient.list_name}..."
      rescue
      end
    end
  end

  def self.list_titles
    %w(Mr Ms Mx Sen Rep Del Com)
  end

  def list_name
    return "#{self.gov_state} #{self.title}. #{self.first_name} #{self.last_name}"
  end
end
