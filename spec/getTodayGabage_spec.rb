require 'timecop'
require __dir__ + '/../getTodayGabage.rb'

describe GabAlert::GetTodayGabage, "when Proceed" do
  before do
    @gabage = GabAlert::GetTodayGabage.new
  end

  it "expect return 古紙・古布 (4, Tue)" do
    time = Time.local(2014, 11,25, 0, 0, 0)
    Timecop.freeze(time)
    expect(@gabage.name).to eq("古紙・古布")
  end

  after do
    @gabage = nil
  end
end
