class Like < ApplicationRecord
  belongs_to :tweet_student
  belongs_to :teacher

#  validates_uniqueness_of :tweet_student_id, scope: :teacher_id
end
