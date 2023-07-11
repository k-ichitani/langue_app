class Teacher < ApplicationRecord
  has_one_attached :image
  has_many :schedules, dependent: :destroy
  has_many :reservations, dependent: :destroy

  enum specialty: { business: 0, travel: 1, exam: 2, daily_conversation:3, culture: 4, other: 5 }
end
