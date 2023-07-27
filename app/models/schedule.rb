class Schedule < ApplicationRecord
  belongs_to :teacher
  has_one :reservation

  validates :teacher_id, presence: true
  validates :start_time, presence: true
  validates :finish_time, presence: true

  validate :date_current_today
  validate :date_before_finish
  validate :date_same_day
  validate :date_two_month_end
  validate :time_one_hour_only

  def date_current_today
    errors.add(:start_time, "は当日は選択できません。明日以降の日付を選択してください。") if start_time < (Date.current + 1)
  end

  def date_before_finish
    return if finish_time.blank? || start_time.blank?
    errors.add(:finish_time, "は開始日時以降の時間を選択してください") if finish_time <= start_time
  end

  def date_same_day
    errors.add(:finish_time, "は開始日と同じ日付を選択してください") if finish_time.day != start_time.day
  end

  def date_two_month_end
    errors.add(:start_time,"は2ヶ月以降の日付は選択できません") if (Date.current >> 2) < start_time
  end

  def time_one_hour_only
    errors.add(:finish_time, "は1時間で選択してください") if finish_time > (start_time + 1.hours)
  end

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
