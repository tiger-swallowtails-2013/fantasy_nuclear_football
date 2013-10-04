class Team < ActiveRecord::Base
  belongs_to :user
  has_many :politician_teams
  has_many :politicians, through: :politician_teams
  validates :user_id, uniqueness: true
  validates :name, presence: true

  def team_score(week)
    sum = 0
    politicians.each {|pol| sum += pol.total_score(week)}
    sum
  end

  def self.top_scorers(week, limit = 10)
    teams = Team.all
    teams.sort_by {|team| team.team_score(week)}.reverse
    teams[0...limit]
  end

  def add_politician(pol)
    if politicians.count < 8 && verify_type(pol.title)
      politicians << pol
    else
      nil #TK possible error message on failure?
    end
  end

  def verify_type(title)
    politicians.where(title: title).count < 4
  end
end
