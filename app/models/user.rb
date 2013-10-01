class User < ActiveRecord::Base
  has_many :teams
  has_many :leagues, through: :teams
  validates_uniqueness_of :username, :facebook_id
  validates_uniqueness_of :email, allow_blank: true
  validates_presence_of :username
end
