class AddTeacherIdToFinal < ActiveRecord::Migration[6.1]
  def change
    add_column :finals, :teacher_id, :integer
  end
end
