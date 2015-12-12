require 'bcrypt'
# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  email              :string(255)      not null
#  pw_digest          :string(255)      not null
#  name               :string(255)      not null
#  pwreset_token      :string(255)      not null
#  session_token      :string(255)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  activated          :string(255)      default("f")
#  activation_token   :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  provider           :string(255)
#  uid                :string(255)
#

class User < ActiveRecord::Base
  attr_reader :first_name, :last_name, :password

  has_attached_file :image, :styles => {
                      :profile => "200x200#",
                      :thumbnail => "25x25#"},
    default_url: "https://s3.amazonaws.com/changeorg_clone_dev/default_:style.png"

  before_validation :ensure_tokens

  validates :email, uniqueness: true
  validates :email, :pw_digest, :pwreset_token,
            :activation_token, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :activated, inclusion: {in: ["t", "f"]}
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :recipients, foreign_key: :creator_id
  has_many :petition_signatures, dependent: :destroy
  has_many :contact_details, as: :contactable, dependent: :destroy
  has_many :petitions,
    class_name: "Petition",
    foreign_key: :creator_id,
    primary_key: :id,
    dependent: :destroy
  has_many :authored_comments,
     class_name: "Comment",
     foreign_key: :user_id,
     primary_key: :id,
     dependent: :destroy
  has_many :signed_petitions, through: :petition_signatures, source: :petition
  has_many :organizations

  def self.generate_token
    SecureRandom.urlsafe_base64(16)
  end

  def self.create_from_fb(fb_data)
    location = fb_data[:info][:location].split(", ") if fb_data[:info][:location]
    location ||= {}

    logger.info "FB DATA: #{fb_data.inspect}"

    user = User.create!(
      uid: fb_data[:uid],
      provider: fb_data[:provider],
      email: fb_data[:info][:email],
      name: fb_data[:info][:name],
      password: Faker::Internet.password,
    )
    if fb_data[:info][:image]
      avatar_url = open(fb_data[:info][:image], allow_redirections: :safe) do |r|
        r.base_uri.to_s
      end
      user.update_attribute(:image, URI.parse(avatar_url))
    end
    user.contact_details.create(
      zip: "Please set!",
      facebook_id: user.uid,
      city: location[0],
      state: location[1])
    return user
  end

  def ensure_tokens
    self.pwreset_token ||= User.generate_token
    self.activation_token ||= User.generate_token
    self.session_token ||= User.generate_token
  end

  def reset_session_token!
    self.session_token = User.generate_token
    self.save!
  end

  def reset_activation_token!
    self.activation_token = User.generate_token
    self.save!
  end

  def password=(secret)
    @password = secret
    self.pw_digest = BCrypt::Password.create(secret)
  end

  def is_password?(password)
    BCrypt::Password.new(self.pw_digest).is_password?(password)
  end

  def first_name
    split_name = self.name.split
    @first_name = split_name.shift
  end

  def last_name
    split_name = self.name.split
    @last_name = split_name.pop
  end

  def middle_name
    split_name = self.name.split
    split_name.shift
    split_name.pop
    @middle_name = split_name.join(" ")
  end

  def contact
    self.contact_details.first
  end

end
