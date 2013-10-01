class User < ActiveRecord::Base
  has_many :teams
  validates_uniqueness_of :username, :email
  validates_uniqueness_of :facebook_id
  validates_presence_of :firstname, :lastname, :username, :email, :password, :facebook_id
end
