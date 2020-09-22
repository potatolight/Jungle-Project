class User < ActiveRecord::Base
  has_secure_password
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, presence: true
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 3 }

  # validates :email, presence: true, uniqueness: { case_sensitive: false }
  def self.authenticate_with_credentials(email, password)
    user = where('LOWER(email) = ?', email.downcase.delete(' '))[0]
    user && user.authenticate(password)
  end 
end
