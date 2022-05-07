class AddDeletedAtToTweetStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :tweet_students, :deleted_at, :datetime
    add_index :tweet_students, :deleted_at
  end
end
