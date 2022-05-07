class AddMiddleIdToTweetStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :tweet_students, :middle_id, :integer
  end
end
