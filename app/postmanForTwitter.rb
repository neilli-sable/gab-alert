require 'twitter'
require __dir__ + '/GetTodayGabage.rb'

module GabAlert
  class PostmanForTwitter

    def post(message)
      @tw = Twitter::REST::Client.new(
        consumer_key: 'zwchlMWLeJgcPPVnIPpBYGlGS',
        consumer_secret: '5xEy3ScLKRKriHyXyRaEZGH0vc0Xm2eKt1BjVekF30gr5NKHUA',
        access_token: '2907199057-8sbjBFya6J4yyfHKBoCCfkSDuzUEBSs5UJYcBvp',
        access_token_secret: 'BcNiGECiL4T7UCGDoFNa8S4BlST4G7B1pTPjnZFkWJPvV'
      )
      @tw.update message
    end
  end

  gabage = GabAlert::GetTodayGabage.new
  pt = PostmanForTwitter.new

  if (gabage.name != "ごみ回収はない")
    pt.post "今日は" + gabage.name + "です。"
  end
end
