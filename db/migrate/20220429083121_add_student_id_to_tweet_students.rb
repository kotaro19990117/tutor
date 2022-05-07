class AddStudentIdToTweetStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :tweet_students, :student_id, :integer
  end
end
