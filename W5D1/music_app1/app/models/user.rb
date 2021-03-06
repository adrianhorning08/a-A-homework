class User < ApplicationRecord
  validates :password_digest, :email, :session_token, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true}

  after_initialize :ensure_session_token
  attr_reader :password

  def generate_session_token
    SecureRandom.urlsafe_base64
  end

  def self.find_by_credentials(email,password)
    @user = User.find_by(email: email)

    if @user.is_password?(password)
      @user
    else
      nil
    end
  end

  def ensure_session_token
    self.session_token ||= generate_session_token
  end

  def reset_session_token
    self.session_token = generate_session_token
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
end
