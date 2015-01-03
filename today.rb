require __dir__ + '/GetTodayGabage.rb'

gabage = GabAlert::GetTodayGabage.new
printf gabage.name
