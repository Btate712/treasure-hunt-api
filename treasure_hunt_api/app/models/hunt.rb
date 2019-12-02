class Hunt < ApplicationRecord
  has_many :hunt_users
  has_many :users, through: :hunt_users
  has_many :clues
end
