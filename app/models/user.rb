class User < ActiveRecord::Base
  attr_accessible :email, :password, :name
  attr_reader :first_name, :last_name

  before_validation :ensure_tokens

  validates :email, :pw_digest, :name, :pwreset_token,
            :auth_token, :session_token, presence: true

  def self.generate_token
    SecureRandom.urlsafe_base64(16)
  end

  def ensure_tokens
    self.pwreset_token ||= User.generate_token
    self.auth_token ||= User.generate_token
    self.session_token ||= User.generate_token
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

end
