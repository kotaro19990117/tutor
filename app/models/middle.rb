class Middle < ApplicationRecord
    belongs_to :teacher
    belongs_to :student
    has_many :tweet_students
end
