class Reservation < ApplicationRecord
  belongs_to :student
  belongs_to :schedule

  validates :student_id, presence: true
  validates :schedule_id, presence: true
  validates :status, presence: true

  # validate :reservation_from_schedule

  # def reservation_from_schedule
  #   errors.add(:start_time, "は予約できません") if start_time == schedule.start_time
  # end

  # def time_before_finish
  #   return if finish_time.blank? || start_time.blank?
  #   errors.add(:finish_time, "は予約できません") if finish_time == start_time + 1.hours
  # end

  enum status: { reserved:0, completed:1, canceled:2 }

end
