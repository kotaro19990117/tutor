class AddTweetStudentIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :tweet_student_id, :integer
  end
end
