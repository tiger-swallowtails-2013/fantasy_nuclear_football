class CreateTablePoliticians < ActiveRecord::Migration
  def change
    create_table :politicians do |g|
      g.string :first_name, :last_name, :nickname, :middle_name, :suffix, 
               :twitter_id, :facebook_id, :party, :gender, :state, :title, 
               :chamber, :bioguide_id
      g.integer :district, :senate_class
      g.boolean :in_office
      g.date :birthday
      g.timestamps
    end
  end
end
