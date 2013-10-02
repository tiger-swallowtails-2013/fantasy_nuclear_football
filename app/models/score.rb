class Score < ActiveRecord::Base
  belongs_to :politician
  validates_presence_of :game_number
end
