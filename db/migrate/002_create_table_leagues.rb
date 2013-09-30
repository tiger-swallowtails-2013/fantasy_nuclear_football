class CreateTableLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |g|
      g.string :name
      g.timestamps
    end
  end
end
