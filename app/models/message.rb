class Message < ApplicationRecord
  belongs_to :teacher
  belongs_to :student
  belongs_to :conversation
end
