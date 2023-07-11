class Schedule < ApplicationRecord
  belongs_to :teacher
  has_many :reservations
end
