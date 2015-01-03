require 'date'
require __dir__ + '/app/GetTodayGabage.rb'

gabage = GabAlert::GetTodayGabage.new
time = (Date.today + 1).to_time
printf gabage.name(time)
