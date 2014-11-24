require __dir__ + '/getTodayGabage.rb'

gabage = GabAlert::GetTodayGabage.new
printf gabage.name
