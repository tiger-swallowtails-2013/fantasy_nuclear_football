class PoliticianTeam < ActiveRecord::Base
  self.table_name='politician_teams'
  belongs_to :politician
  belongs_to :team
  validates :politician_id, uniqueness: { scope: :team_id, 
    message: 'You only get one copy of any politician on your team, Dude.'}
end
