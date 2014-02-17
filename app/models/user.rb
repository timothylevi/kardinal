class User < ActiveRecord::Base
  attr_accessible :email, :password, :name

  validates :email, :name, :pw_digest, presence: true
end
