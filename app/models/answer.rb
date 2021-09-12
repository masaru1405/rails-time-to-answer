class Answer < ApplicationRecord
  belongs_to :question
  #validates :correct, presence: true
end
