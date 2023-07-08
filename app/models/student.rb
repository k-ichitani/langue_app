class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :reservations
  
  GUEST_USER_EMAIL = "guest@example.com"
  
  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |student|
      student.password = SecureRandom.urlsafe_base64
      student.last_name = "ゲスト"
      student.first_name ="ユーザー"
      student.telephone_number = "0"
    end
  end
end
