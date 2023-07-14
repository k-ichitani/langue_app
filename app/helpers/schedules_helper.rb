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

  def check_schedule(schedules, day, time)
    result = false
    schedules_count = schedules.count
    if schedules_count > 1
      schedules.each do |schedule|
        # result = schedule[:day].eql?(day.strftime("%Y-%m-%d")) && schedule[:time].eql?(time)
        result = schedule[:start_time].eql?(day) && schedule[:finish_time].eql?(time)
        return result if result
      end
    elsif schedules_count == 1
      # result = schedules[0][:day].eql?(day.strftime("%Y-%m-%d")) && schedules[0][:time].eql?(time)
      schedule = schedules[0][:start_time].eql?(day) && schedule[:finish_time].eql?(time)
      return result if result
    end
    return result
  end
end
