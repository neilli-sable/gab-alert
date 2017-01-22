module GabAlert
  class GetTodayGabage

    # 実行することで他のメソッドを呼び出し、ゴミの種類を返す。
    def name(time=Time.now)
      ex = exceptionCheck(time)
      if ex.nil?
        day_and_count = getDayAndCount(time)
        return checkTrashByDayAndCount(day_and_count[:day], day_and_count[:count])
      end
      return ex
    end

    private

    # timeオブジェクトを受け取って、曜日と第何週かを返す。
    def getDayAndCount(time)
      adjustDay = time.day
      if (time.month === 1)
        # 3が日分、ズラす
        adjustDay = time.day - 3
      end

      day = time.wday
      count = ((adjustDay - 1) / 7) + 1

      if (time.month === 1)

      end

      return {day: day, count: count}
    end

    # 第何○週の何曜日かを引数で受け取って、ゴミの種類を返す。
    def checkTrashByDayAndCount(day, count)
      case day
      when 1, 5 then
        return "燃えるごみ"

      when 2 then
        if count === 1 || count === 3
          return "かん"
        end
        if count === 2 || count === 4
          return "古紙・古布"
        end

      when 3 then
        if count === 1 || count === 3
          return "粗大ごみ"
        end
        if count === 2 || count === 4
          return "ペットボトル"
        end

      when 4 then
        if count === 1 || count === 3
          return "燃やせないごみ"
        end
        if count === 2 || count === 4
          return "びん・スプレー容器"
        end
      end

      return "ごみ回収はない"
    end

    # 1月のゴミ回収が特殊なので、それに関連した例外チェック
    # ゴミの種類を返す。
    def exceptionCheck(time)
      if time.month === 1
        if time.day === 3
          return "燃えるごみ"
        end

        if time.day <= 2
          return "ごみ回収はない"
        end
      end

      if time.month === 12
        if time.day === 29
          return "燃えるごみ"
        end

        if time.day === 30
          return "ごみ回収はない"
        end

        if time.day === 29
          return "ごみ回収はない"
        end
      end
      return nil
    end

  end
end
