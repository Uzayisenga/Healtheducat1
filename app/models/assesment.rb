class Assesment < ApplicationRecord
    has_many :answers 
    has_many :results, dependent: :destroy
end
