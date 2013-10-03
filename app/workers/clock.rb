require 'congress'
require 'clockwork'
# require_relative 'sunlight_legislators_query'
Congress.key = '8096702653af468b9126fb83e273fd97'

include Clockwork

handler do
	puts Congress.floor_updates
	puts "{job}"
end

every(10.second, 'frequent.job')
every(1.hour, 'hourly.job')