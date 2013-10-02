class CreateTableScores < ActiveRecord::Migration
  def change
    create_table :scores do |g|
      g.integer :twitter_mentions, :twitter_follower_increase
      g.integer :vote_score, :bill_score
      g.integer :game_number
      g.belongs_to :politician
      g.timestamps
    end
  end

end
