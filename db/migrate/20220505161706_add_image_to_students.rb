class AddImageToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :image, :string
  end
end
