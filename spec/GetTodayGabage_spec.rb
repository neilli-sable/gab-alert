require 'timecop'
require __dir__ + '/../app/GetTodayGabage.rb'

describe GabAlert::GetTodayGabage, "when Proceed" do
  before do
    @gabage = GabAlert::GetTodayGabage.new
  end

  it "expect return 古紙・古布 (4, Tue)" do
    time = Time.local(2014, 11, 25, 0, 0, 0)
    Timecop.freeze(time)
    expect(@gabage.name).to eq("古紙・古布")
  end

  it "expect return 収集なし (1, Fry)" do
    time = Time.local(2016, 1, 1, 0, 0, 0)
    Timecop.freeze(time)
    expect(@gabage.name).to eq("ごみ回収はない")
  end

  it "expect return 燃やせる (1, Sun)" do
    time = Time.local(2016, 1, 3, 0, 0, 0)
    Timecop.freeze(time)
    expect(@gabage.name).to eq("燃えるごみ")
  end

  it "expect return ペットボトル (2, Wed)" do
    time = Time.local(2017, 1, 11, 0, 0, 0)
    Timecop.freeze(time)
    expect(@gabage.name).to eq("ペットボトル")
  end

  it "expect return 収集なし (1, Mon)" do
    time = Time.local(2017, 1, 2, 0, 0, 0)
    Timecop.freeze(time)
    expect(@gabage.name).to eq("ごみ回収はない")
  end

  it "expect return 燃やせる (1, Tue)" do
    time = Time.local(2017, 1, 3, 0, 0, 0)
    Timecop.freeze(time)
    expect(@gabage.name).to eq("燃えるごみ")
  end

  it "expect return かん (4, Tue)" do
    time = Time.local(2017, 1, 24, 0, 0, 0)
    Timecop.freeze(time)
    expect(@gabage.name).to eq("かん")
  end

  after do
    @gabage = nil
  end
end
