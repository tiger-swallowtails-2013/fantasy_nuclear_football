class Team < ActiveRecord::Base
  belongs_to :user
  belongs_to :league
  has_many :politicians, through: :politicians_teams
  validates :user_id, uniqueness: {scope: :league_id, message: "Each user is allowed only one team per league, you scruffy-looking nerf herder!"}
  validates :name, presence: true
end
