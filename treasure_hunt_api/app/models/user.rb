class User < ApplicationRecord
  validates_presence_of :name, :email, :password_digest
  validates :email, uniqueness: true
  validates :name, uniqueness: true

  has_many :hunt_users
  has_many :hunts, through: :hunt_users

  has_secure_password

end
