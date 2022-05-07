class AddStudentIdToMiddle < ActiveRecord::Migration[6.1]
  def change
    add_column :middles, :student_id, :integer
  end
end
