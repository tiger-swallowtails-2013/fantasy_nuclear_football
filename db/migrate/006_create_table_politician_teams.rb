class CreateTablePoliticianTeams < ActiveRecord::Migration
  def change
    create_table :politician_teams do |g|
      g.integer :politician_id
      g.integer :team_id
    end
  end
end
