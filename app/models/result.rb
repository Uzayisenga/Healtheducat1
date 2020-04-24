class Result < ApplicationRecord
  belongs_to :assesments
  attr_accessor :answer, :question_id
end
