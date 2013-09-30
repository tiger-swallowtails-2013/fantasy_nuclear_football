class User < ActiveRecord::Base
  has_many :teams
  has_many :leagues through :teams
end
