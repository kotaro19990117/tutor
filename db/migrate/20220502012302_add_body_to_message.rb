class AddBodyToMessage < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :body, :text
  end
end
