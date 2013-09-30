class User < ActiveRecord::Base
  has_many :teams
  has_many :leagues through :teams
  validates :username, :email, uniqueness: true
  validates :firstname, :lastname, :username, :email, :password, presence: true
end
