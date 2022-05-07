class AddMiddleIdToTeacher < ActiveRecord::Migration[6.1]
  def change
    add_column :teachers, :middle_id, :integer
  end
end
