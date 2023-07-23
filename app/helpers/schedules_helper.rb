module SchedulesHelper
  def times
    times = ["00:00",
            "01:00",
            "02:00",
            "03:00",
            "04:00",
            "06:00",
            "07:00",
            "08:00",
            "09:00",
            "10:00",
            "11:00",
            "12:00",
            "13:00",
            "14:00",
            "15:00",
            "16:00",
            "17:00",
            "18:00",
            "19:00",
            "20:00",
            "21:00",
            "22:00",
            "23:00"]
  end

  # def check_schedule(day, time)
  #   check_time = Time.zone.parse("#{day} #{time}")

  #   @schedules.each do |schedule|
  #     # check_time  7/15 19:00 <= ここが○ になるか、×になるかを知りたい
  #     # schedule.start_time: 7/15 19:00
  #     # schedule.finish_time: 7/15 21:00
  #     return false if schedule.reservation.present?
  #     if schedule.start_time <= check_time && check_time < schedule.finish_time
  #       #binding.pry
  #       return true
  #     end
  #   end
  #   return false
  # end

  def check_schedule(day, time)
  check_time = Time.zone.parse("#{day} #{time}")

  @schedules.each do |schedule|
    if schedule.start_time <= check_time && check_time < schedule.finish_time
      # スケジュールが見つかった場合の処理
      if schedule.reservation.present?
        # 予約が入っている場合はfalseを返す
        return false
      else
        # 予約が入っていない場合はtrueを返す
        return true
      end
    end
  end

  # スケジュールが見つからなかった場合はfalseを返す
  return false
end


  # def teacher_name(day, time)
  #   check_time = Time.zone.parse("#{day} #{time}")

  #   @schedules.each do |schedule|
  #     # check_time  7/15 19:00 <= ここが○ になるか、-になるかを知りたい
  #     # schedule.start_time: 7/15 19:00
  #     # schedule.finish_time: 7/15 21:00
  #     # if schedule.start_time <= check_time && check_time < schedule.finish_time
  #       return schedule.teacher.last_name
  #     # else

  #       # return ''
  #     # end
  #   end
  # end

end
