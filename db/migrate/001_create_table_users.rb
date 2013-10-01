class CreateTableUsers < ActiveRecord::Migration
  def change
    create_table :users do |g|
      g.string :firstname, :lastname, :username, :email, :password, :facebook_id
      g.timestamps
    end
  end
end
