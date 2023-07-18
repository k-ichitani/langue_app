class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reservations

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true
  validates :telephone_number, presence: true
  validates :encrypted_password, presence: true
  validates :is_deleted, inclusion: {in: [true, false ]}

  def active_for_authentication?
    # is_deletedがfalseならtrueを返すようにしている
    super && (is_deleted == false)
  end

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
