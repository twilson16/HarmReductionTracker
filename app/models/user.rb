class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #For Rails 5 Devise gem, note that protect_from_forgery is no longer prepended to the before_action chain, so if you have set authenticate_user before protect_from_forgery, your request will result in "Can't verify CSRF token authenticity." To resolve this, either change the order in which you call them, or use protect_from_forgery prepend: true.
  
  has_secure_token :auth_token
  # has_secure_password
  has_many :inventories

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone, format: { with: /\A\(?\d{3}\)?[- ]?\d{3}[- ]?\d{4}\z/ }
  
end
