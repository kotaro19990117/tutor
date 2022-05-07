class AddDetailsToTeachers < ActiveRecord::Migration[6.1]
  def change
    add_column :teachers, :name, :string
    add_column :teachers, :profile, :text
  end
end
