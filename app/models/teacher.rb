class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many :schedules, dependent: :destroy
  has_many :reservations, dependent: :destroy

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true
  validates :telephone_number, presence: true
  validates :encrypted_password, presence: true
  validates :specialty, presence: true
  validates :is_deleted, inclusion: {in: [true, false ]}

  enum specialty: { business: 0, travel: 1, exam: 2, daily_conversation:3, culture: 4, other: 5 }
  
  
end
