class User < ActiveRecord::Base
	has_secure_password
	has_many :posts
	
  validates :first_name, :last_name, :email, :username, presence: { error: "Missing info! Please fill out." }
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
  validates :email, uniqueness: true
  validates :username, uniqueness: true

end
