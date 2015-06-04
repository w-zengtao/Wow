class User < ActiveRecord::Base

  #TODO 头像 还有 nickname

  before_save :ensure_auth_token
  before_save :ensure_encrypted_password

  
  
  class << self
    def bcrypt(password)
      Digest::SHA1.hexdigest(password)
    end
  end
  
  private
  
  def ensure_encrypted_password
    self.encrypted_password = User.bcrypt(encrypted_password)
  end

  def ensure_auth_token
    if auth_token.blank?
      self.auth_token = generate_auth_token
    end
  end

  def generate_auth_token
    loop do 
      token = SecureRandom.urlsafe_base64(15).tr('lIO0', 'sxyz')
      break token unless User.where(auth_token: token).first
    end
  end
end
