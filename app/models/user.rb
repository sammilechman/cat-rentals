# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  user_name       :string(255)      not null
#  session_token   :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  attr_reader :password
  validates :user_name, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  before_validation :ensure_session_token

  has_many :cats

  def self.find_by_credentials(creds)
    user = User.find_by_user_name( creds[:user_name] )
    return user if user.try(:is_password?, creds[:password] )
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.hex
  end

  def reset_session_token!
    #Do we need a attr_accessor?
    self.session_token = SecureRandom.hex
    self.save!
    session_token
  end

  def password=(plaintext)
    @password = plaintext
    self.password_digest = BCrypt::Password.create(plaintext)
  end

  def is_password?(plaintext)
    BCrypt::Password.new(password_digest).is_password?(plaintext)
  end

end
