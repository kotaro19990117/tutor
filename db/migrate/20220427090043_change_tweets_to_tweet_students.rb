class ChangeTweetsToTweetStudents < ActiveRecord::Migration[6.1]
  def change
    rename_table :tweets, :tweet_students
  end
end
