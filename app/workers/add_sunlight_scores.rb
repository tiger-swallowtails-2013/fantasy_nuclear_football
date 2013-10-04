require_relative '../../config/main.rb'

module AddSunlightScores
  def self.update
    sunlight_scores = SunlightScore.all
    sunlight_scores.map! {|score| Politician.find_by bioguide_id: score.bioguide_id}
    sunlight_scores.map! {|pol| pol.id}

    sunlight_scores.each do |id|
      score = Score.find_by politician_id: id
      if score
        if score.vote_score
          score.vote_score += 1
          score.save
        else
          score.vote_score = 1
          score.save
        end
      else
        Score.create(
          politician_id: id,
          vote_score: 1,
          game_number: 1 )
      end
    end

    SunlightScore.destroy_all

  end
end

