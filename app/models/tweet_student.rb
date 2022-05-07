class TweetStudent < ApplicationRecord

    belongs_to :student
    belongs_to :middle

    has_many :likes, dependent: :destroy
    has_many :liked_teachers, through: :likes, source: :teacher

    mount_uploader :image, ImageUploader
    
    acts_as_paranoid
end
