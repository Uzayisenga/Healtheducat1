class Quiz < ApplicationRecord
    has_many :mc_questions, dependent: :destroy
   
end

