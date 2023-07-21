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
      # match_reservation = reservation_for_schedule(schedule)
      # if schedule.start_time <= check_time && check_time < schedule.finish_time && match_reservation.present?
      # end
    end

    return false
  end

  # def reservation_for_schedule(schedule)
  # @reservations.find { |reservation| reservation.schedule_id == schedule.id }
  # end



  def check_reservation(day, time)
    check_time = Time.zone.parse("#{day} #{time}")

    @reservations.each do |reservation|
      # check_time  7/15 19:00 <= ここが○ になるか、-になるかを知りたい
      # schedule.start_time: 7/15 19:00
      # schedule.finish_time: 7/15 21:00
      if reservation.schedule.start_time == check_time 
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
