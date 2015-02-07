require __dir__ + '/app/GetTodayGabage.rb'

gabage = GabAlert::GetTodayGabage.new
printf gabage.name
