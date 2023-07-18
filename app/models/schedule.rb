class Schedule < ApplicationRecord
  belongs_to :teacher
  has_many :reservations

  validates :teacher_id, presence: true
  validates :start_time, presence: true
  validates :finish_time, presence: true

  def self.schedules_after_three_month
    schedules = Schedule.all.where("start_time >= ?", Date.current).where("start_time < ?", Date.current >> 2).order(start_time: :desc)
    schedule_data = []
    schedules.each do |schedule|
      # schedules_hash = {}
      # schedules_hash.merge!(day: schedule.day.strftime("%Y-%m-%d"), time: schedule.time)
      # schedule_data.push(schedules_hash)
      # duration = schedule.finish_time - schedule.start_time
      # schedules_hash = { day: schedule.start_time.to_date, time: schedule.start_time.strftime("%H:%M"), duration: duration }
      schedules_hash = { day: schedule.start_time.to_date, time: schedule.start_time.strftime("%H:%M") }
      schedule_data.push(schedules_hash)
    end
    schedule_data
  end

  # def start_time
  #       self.my_related_model.start ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  # end

end
