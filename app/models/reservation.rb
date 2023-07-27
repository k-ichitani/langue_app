class Reservation < ApplicationRecord
  belongs_to :student
  belongs_to :schedule

  validates :student_id, presence: true
  validates :schedule_id, presence: true, uniqueness: true
  validates :status, presence: true

  enum status: { reserved:0, completed:1, canceled:2 }

end
