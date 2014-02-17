# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  email         :string(255)      not null
#  pw_digest     :string(255)      not null
#  name          :string(255)      not null
#  authorized    :string(255)      default("f")
#  pwreset_token :string(255)      not null
#  auth_token    :string(255)      not null
#  session_token :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :password, :name
  attr_reader :first_name, :last_name, :password

  before_validation :ensure_tokens # tested!

  validates :email, uniqueness: true # tested!
  validates :email, :pw_digest, :name, :pwreset_token,
            :auth_token, :session_token, presence: true # tested!
  validates :password, length: { minimum: 6, allow_nil: true } # tested!

  def self.generate_token # tested!
    SecureRandom.urlsafe_base64(16)
  end

  def ensure_tokens # tested!
    self.pwreset_token ||= User.generate_token
    self.auth_token ||= User.generate_token
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
