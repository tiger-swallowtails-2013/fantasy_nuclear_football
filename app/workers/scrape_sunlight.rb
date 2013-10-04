require 'congress'
require_relative '../../config/main.rb'

Congress.key = ENV['SUNLIGHT_LEGISLATORS_KEY']



module SunlightScraper

  def self.scrape
    events = get_legislator_events
    remove_old_events(events,1)
    add_to_database(events)
  end

  def self.seed
    events = get_legislator_events
    add_to_database(events)
  end

  def self.remove_old_events(events, hours)
    events.select! do |update|
      update_time = DateTime.strptime(update[:timestamp], '%Y-%m-%dT%H:%M:%S%z')
      ((DateTime.now - update_time) * 24).to_f < hours
    end 
  end

  def self.get_legislator_events
    Congress.floor_updates[:results].select {|update| update[:legislator_ids] != []}
  end

  def self.add_to_database(events)
    events.each do |pol|
      SunlightScore.create(activity: 1, bioguide_id: pol[:legislator_ids][0],
                        sunlight_timestamp: pol[:timestamp], description: pol[:update])
    end
  end

end
