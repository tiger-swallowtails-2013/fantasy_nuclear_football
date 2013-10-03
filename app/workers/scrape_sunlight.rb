require 'congress'
require_relative '../../config/main.rb'

Congress.key = '8096702653af468b9126fb83e273fd97'

events = Congress.floor_updates[:results].select {|update| update[:legislator_ids] != []}

events.each do |pol|
  SunlightScore.create(activity: 1, bioguide_id: pol[:legislator_ids][0],
                      sunlight_timestamp: pol[:timestamp], description: pol[:update])
end
