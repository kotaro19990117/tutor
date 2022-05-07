class CreateFinals < ActiveRecord::Migration[6.1]
  def change
    create_table :finals do |t|
      t.text :body, null: false, default: ''

      t.timestamps
    end
  end
end
