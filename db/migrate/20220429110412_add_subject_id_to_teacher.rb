class AddSubjectIdToTeacher < ActiveRecord::Migration[6.1]
  def change
    add_column :teachers, :subject_id, :integer
  end
end
