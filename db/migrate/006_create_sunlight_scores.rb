class CreateSunlightScores < ActiveRecord::Migration
  def change
    create_table :sunlight_scores do |g|
      g.string :activity
      g.string :bioguide_id
      g.string :sunlight_timestamp
      g.string :description
      g.timestamps
    end
  end
end
