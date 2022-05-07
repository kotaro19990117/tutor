class AddTodoIdToTeacher < ActiveRecord::Migration[6.1]
  def change
    add_column :teachers, :todo_id, :integer
  end
end
