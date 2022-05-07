class AddTeacherIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :teacher_id, :integer
  end
end
