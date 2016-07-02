class User < ActiveRecord::Base
  has_secure_password

  VALID_EMAIL_FORMAT = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :email, format: { with: VALID_EMAIL_FORMAT }
  validates :name, :username, :email, presence: true, length: { minimum: 3 }
  validates :password, presence: true, length: { minimum: 3 }
end
