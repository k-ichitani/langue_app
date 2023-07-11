class Schedule < ApplicationRecord
  belongs_to :teacher
  has_many :reservations

  validates :teacher_id, presence: true
  validates :start_time, presence: true
  validates :finish_time, presence: true

end
