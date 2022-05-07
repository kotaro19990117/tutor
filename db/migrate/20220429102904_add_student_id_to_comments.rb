class AddStudentIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :student_id, :integer
  end
end
