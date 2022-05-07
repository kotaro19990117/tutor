class Relation < ApplicationRecord
  belongs_to :teacher
  belongs_to :student
  validates_uniqueness_of :student_id, scope: :teacher_id
end
