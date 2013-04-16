class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  extend FriendlyId
  friendly_id :username, use: :slugged
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  # attr_accessible :title, :body
  attr_accessible :login
  attr_accessor :login
  
  UNUSEABLE_USERNAMES = ["meals", "about", "login", "log_in", "signup", "sign_up", "signin", "sign_in", "logout", "log_out", "signout", "sign_out"] 
  
  validate :username_useable?
  validates :username, presence: true, uniqueness: { case_sensitive: true }

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
  
  
  # Username validation
  def username_useable?
    if UNUSEABLE_USERNAMES.include?(username.downcase)
      errors.add(:username, "not valid.")
    end
  end
  
end
