class CreateTablePoliticiansTeams < ActiveRecord::Migration
  def change
    create_table :politicians_teams do |g|
      g.belongs_to :team
      g.belongs_to :politician
    end
  end
end
