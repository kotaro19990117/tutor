class AddTeacherIdToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :teacher_id, :integer
  end
end
