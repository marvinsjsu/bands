# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#
require 'bcrypt'

class User < ActiveRecord::Base
  attr_reader :password

  before_validation :session_token_present
  validates :email, :password_digest, :session_token, presence: true
  validates :email, uniqueness: true

  def self.find_by_credentials(email, secret)
    user = User.find_by_email(email)
    return nil if user.nil?
    return user if user.is_password?(secret)
    nil
  end

  def self.generate_session_token
    SecureRandom.base64
  end

  def is_password?(secret)
    bcrypt_passwd = BCrypt::Password.new(self.password_digest).is_password?(secret)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    session_token = Users.generate_session_token
    session[:session_token] = session_token
    self.session_token = session_token
  end

  private

  def session_token_present
    self.session_token ||= User.generate_session_token
  end
end






