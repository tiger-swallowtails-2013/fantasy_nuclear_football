class CreateTableUsers < ActiveRecord::Migration
  def change
    create_table :users do |g|
      g.string :firstname, :lastname, :username, :email, :password
      g.has_many :teams
      g.belongs_to :league through :teams
      g.timestamps
    end
  end
end
