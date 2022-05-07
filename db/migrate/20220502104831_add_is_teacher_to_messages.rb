class AddIsTeacherToMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :is_teacher, :boolean, default: false, null: false
  end
end
