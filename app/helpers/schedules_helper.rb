module SchedulesHelper
  def times
    times = ["00:00",
            "00:30",
            "01:00",
            "01:30",
            "02:00",
            "02:30",
            "03:00",
            "03:30",
            "04:00",
            "04:30",
            "05:00",
            "05:30",
            "06:00",
            "06:30",
            "07:00",
            "07:30",
            "08:00",
            "08:30",
            "09:00",
            "09:30",
            "10:00",
            "10:30",
            "11:00",
            "11:30",
            "12:00",
            "12:30",
            "13:00",
            "13:30",
            "14:00",
            "14:30",
            "15:00",
            "15:30",
            "16:00",
            "16:30",
            "17:00",
            "17:30",
            "18:00",
            "18:30",
            "19:00",
            "19:30",
            "20:00",
            "20:30",
            "21:00",
            "21:30",
            "22:00",
            "22:30",
            "23:00",
            "23:30"]
  end

  def check_schedule(day, time)
    check_time = Time.zone.parse("#{day} #{time}")

    @schedules.each do |schedule|
      # check_time  7/15 19:00 <= ここが○ になるか、-になるかを知りたい
      # schedule.start_time: 7/15 19:00
      # schedule.finish_time: 7/15 21:00
      if schedule.start_time <= check_time && check_time < schedule.finish_time
        #byebug
        return true
      end
    end

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
