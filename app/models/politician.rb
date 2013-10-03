class Politician < ActiveRecord::Base
  has_many :politician_teams
  has_many :teams, through: :politician_teams
  has_many :scores

  def info
    "#{self.title}. #{self.first_name} #{self.last_name}, #{self.state} [#{self.party}]"
  end
end
