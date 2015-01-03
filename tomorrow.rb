require 'date'
require __dir__ + '/GetTodayGabage.rb'

gabage = GabAlert::GetTodayGabage.new
time = (Date.today + 1).to_time
printf gabage.name(time)
