class Team < ActiveRecord::Base
  belongs_to :user
  has_many :politician_teams
  has_many :politicians, through: :politician_teams
  validates :user_id, uniqueness: true
  validates :name, presence: true
end
