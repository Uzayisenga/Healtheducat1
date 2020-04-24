class Exam < ApplicationRecord
  belongs_to :course
  belongs_to :users
end
