class Teacher < ApplicationRecord
  has_one_attached :image
  has_many :schedules, dependent: :destroy
  has_many :reservations, dependent: :destroy
end
