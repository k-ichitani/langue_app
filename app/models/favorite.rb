class Favorite < ApplicationRecord
  belongs_to :student
  belongs_to :teacher
  
  validates_uniqueness_of :teacher_id, scope: :student_id
end
