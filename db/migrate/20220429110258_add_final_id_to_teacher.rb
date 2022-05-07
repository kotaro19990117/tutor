class AddFinalIdToTeacher < ActiveRecord::Migration[6.1]
  def change
    add_column :teachers, :final_id, :integer
  end
end
