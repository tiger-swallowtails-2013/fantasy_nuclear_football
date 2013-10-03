require 'congress'
require_relative '../../config/main.rb'

Congress.key = ENV['SUNLIGHT_LEGISLATORS_KEY']

module SunlightScraper

  def self.scrape
    events = Congress.floor_updates[:results].select {|update| update[:legislator_ids] != []}

    events.each do |pol|
      SunlightScore.create(activity: 1, bioguide_id: pol[:legislator_ids][0],
                        sunlight_timestamp: pol[:timestamp], description: pol[:update])
    end
  end

end
