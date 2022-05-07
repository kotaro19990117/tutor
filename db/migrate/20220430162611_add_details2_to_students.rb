class AddDetails2ToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :subject_id, :integer
    add_column :students, :middle_id, :integer
    add_column :students, :final_id, :integer
    add_column :students, :todo_id, :integer
  end
end
