class AddStudentIdToFinal < ActiveRecord::Migration[6.1]
  def change
    add_column :finals, :student_id, :integer
  end
end
