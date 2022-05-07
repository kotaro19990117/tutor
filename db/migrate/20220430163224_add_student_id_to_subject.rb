class AddStudentIdToSubject < ActiveRecord::Migration[6.1]
  def change
    add_column :subjects, :student_id, :integer
  end
end
