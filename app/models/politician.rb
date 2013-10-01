class Politician < ActiveRecord::Base
  has_many :teams through: :politicians_teams
end
