class AddTeacherIdToSubject < ActiveRecord::Migration[6.1]
  def change
    add_column :subjects, :teacher_id, :integer
  end
end
