class AddStudentIdToTodo < ActiveRecord::Migration[6.1]
  def change
    add_column :todos, :student_id, :integer
  end
end
