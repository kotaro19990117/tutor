class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.text :body, null: false, default: ''

      t.timestamps
    end
  end
end
