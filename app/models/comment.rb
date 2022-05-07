class Comment < ApplicationRecord
    belongs_to :teacher
    belongs_to :student
    belongs_to :tweet_student
end
