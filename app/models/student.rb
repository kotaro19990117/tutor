class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweet_students, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :relations, dependent: :destroy
  has_many :relationed_teachers, through: :relations, source: :teacher
  has_many :subjects, dependent: :destroy
  has_many :finals, dependent: :destroy
  has_many :middles, dependent: :destroy
  has_many :todos, dependent: :destroy
  has_many :conversations, dependent: :destroy
  has_many :messages
  has_many :schedules
  
  belongs_to :teacher

  validates :name, presence: true
  validates :profile, length: { maximum:200 }

  mount_uploader :image, ImageUploader

  def already_liked?(tweet_student)
    self.likes.exists?(tweet_student_id: tweet_student.id)
  end
end
