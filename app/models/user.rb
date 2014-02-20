# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  email            :string(255)      not null
#  pw_digest        :string(255)      not null
#  name             :string(255)      not null
#  pwreset_token    :string(255)      not null
#  session_token    :string(255)      not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  activated        :string(255)      default("f")
#  activation_token :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :password, :name, :contact_details
  attr_reader :first_name, :last_name, :password

  before_validation :ensure_tokens # tested!

  validates :email, uniqueness: true # tested!
  validates :email, :pw_digest, :name, :pwreset_token,
            :activation_token, :session_token, presence: true # tested!
  validates :password, length: { minimum: 6, allow_nil: true } # tested!
  validates :activated, inclusion: {in: ["t", "f"]}

  has_many :recipients, foreign_key: :creator_id
  has_many :petition_signatures, dependent: :destroy
  has_many :contact_details, as: :contactable, dependent: :destroy
  has_many :petitions,
    class_name: "Petition",
    foreign_key: :creator_id,
    primary_key: :id,
    dependent: :destroy

  has_many :signed_petitions, through: :petition_signatures, source: :petition

  def self.generate_token # tested!
    SecureRandom.urlsafe_base64(16)
  end

  def ensure_tokens # tested!
    self.pwreset_token ||= User.generate_token
    self.activation_token ||= User.generate_token
    self.session_token ||= User.generate_token
  end

  def reset_session_token! # tested!
    self.session_token = User.generate_token
    self.save!
  end

  def password=(secret) # tested!
    @password = secret
    self.pw_digest = BCrypt::Password.create(secret)
  end

  def is_password?(password) # tested!
    BCrypt::Password.new(self.pw_digest).is_password?(password)
  end

  def first_name # tested!
    split_name = self.name.split
    @first_name = split_name.shift
  end

  def last_name # tested!
    split_name = self.name.split
    @last_name = split_name.pop
  end

  def middle_name # tested!
    split_name = self.name.split
    split_name.shift
    split_name.pop
    @middle_name = split_name.join(" ")
  end

end
