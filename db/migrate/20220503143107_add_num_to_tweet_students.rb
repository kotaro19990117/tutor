class AddNumToTweetStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :tweet_students, :num, :integer
  end
end
