class Politician < ActiveRecord::Base
  has_many :politician_teams
  has_many :teams, through: :politician_teams
  has_many :scores

  def info
    "#{self.title}. #{self.first_name} #{self.last_name}, #{self.state} [#{self.party}]"
  end

  def self.getAllTwitterHandles
  	all.delete_if{ |politician| politician.in_office == false || politician.twitter_id.nil? }.map{ |politician| politician.twitter_id }.map!{|politician| "@#{politician}"}
  end

  def twitter_score(week)
    pol_score = scores.where(game_number: week)[0]
    if pol_score && pol_score.twitter_mentions
      pol_score.twitter_mentions.to_f / 20
    else
      0
    end
  end

  def sunlight_score(week)
    pol_score = scores.where(game_number: week)[0]
    if pol_score && pol_score.vote_score
      pol_score.vote_score * 5
    else
      0
    end
  end

  def total_score(week)
    twitter_score(week) + sunlight_score(week)
  end

  def self.top_scorers(week, limit = 10)
    politicos = Politician.all
    politicos.sort_by {|pol| pol.total_score(week)}.reverse
    politicos[0...limit]
  end

  def self.sort_by_score(week)
    politicos = Politician.all
    politicos.sort_by {|pol| pol.total_score(week)}.reverse
  end

end
