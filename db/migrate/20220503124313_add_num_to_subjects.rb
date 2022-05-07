class AddNumToSubjects < ActiveRecord::Migration[6.1]
  def change
    add_column :subjects, :num, :integer
  end
end
