class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many :likes, dependent: :destroy
  has_many :liked_tweet_students, through: :likes, source: :tweet_student
  has_many :comments, dependent: :destroy
  has_many :subjects, dependent: :destroy
  has_many :finals, dependent: :destroy
  has_many :middles, dependent: :destroy
  has_many :todos, dependent: :destroy
  has_many :relations, dependent: :destroy
  has_many :relationed_students, through: :relations, source: :student
  has_many :conversations, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :students
  has_many :schedules

  validates :name, presence: true
  validates :profile, length: { maximum:200 }

  mount_uploader :image, ImageUploader

  def already_liked?(tweet_student)
    self.likes.exists?(tweet_student_id: tweet_student.id)
  end

  def already_relationed?(student)
    self.relations.exists?(student_id: student.id)
  end

end
