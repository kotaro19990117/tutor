class AddTeacherIdToTodo < ActiveRecord::Migration[6.1]
  def change
    add_column :todos, :teacher_id, :integer
  end
end
