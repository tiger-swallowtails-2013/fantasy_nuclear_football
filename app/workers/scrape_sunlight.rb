require 'congress'
require_relative '../../config/main.rb'

# Congress.key = ENV['SUNLIGHT_LEGISLATORS_KEY']
Congress.key = 'b4a075b0ee6b4978835984db7173a173'


module SunlightScraper

  def self.scrape
    events = Congress.floor_updates[:results].select {|update| update[:legislator_ids] != []}
    events.select do |update|
      update_time = DateTime.strptime(update[:timestamp], '%Y-%m-%dT%H:%M:%S%z')
      ((DateTime.now - update_time) * 24).to_f < 1
    end 

    events.each do |pol|
      SunlightScore.create(activity: 1, bioguide_id: pol[:legislator_ids][0],
                        sunlight_timestamp: pol[:timestamp], description: pol[:update])
    end
  end

end
