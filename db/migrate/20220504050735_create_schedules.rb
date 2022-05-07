class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.integer :student_id
      t.text :content
      t.datetime :start_time

      t.timestamps
    end
  end
end
