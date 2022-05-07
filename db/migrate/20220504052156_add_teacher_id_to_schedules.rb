class AddTeacherIdToSchedules < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :teacher_id, :integer
  end
end
