class AddDetails2ToTweetStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :tweet_students, :image, :string
    add_column :tweet_students, :achivement, :integer
    add_column :tweet_students, :notget, :text
  end
end
