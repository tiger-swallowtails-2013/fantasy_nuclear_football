class CreateTableLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |g|
      g.string :name
      g.has_many :teams
      g.belongs_to :user through :teams
      g.timestamps
    end
  end
end
