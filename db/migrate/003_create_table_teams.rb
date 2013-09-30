class CreateTableTeams < ActiveRecord::Migration
  def change
    create_table :teams do |g|
      g.string :name
      g.belongs_to :user
      g.belongs_to :league
      g.timestamps
    end
  end
end
