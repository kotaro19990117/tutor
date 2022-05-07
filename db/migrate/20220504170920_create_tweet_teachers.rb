class CreateTweetTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :tweet_teachers do |t|

      t.timestamps
    end
  end
end
