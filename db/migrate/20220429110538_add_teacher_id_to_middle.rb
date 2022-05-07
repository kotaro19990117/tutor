class AddTeacherIdToMiddle < ActiveRecord::Migration[6.1]
  def change
    add_column :middles, :teacher_id, :integer
  end
end
