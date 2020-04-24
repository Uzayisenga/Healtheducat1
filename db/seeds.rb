# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

quiz1 = Quiz.create!(title: 'MVC Concepts', description: 'This quiz covers concepts related to the Model-View-Controller web application architecture.')
 quiz2 = Quiz.create!(title: 'Rails Concepts', description: 'This quiz covers concepts related to web application development using the Ruby on Rails platform.')
q1 = McQuestion.create!(question: 'One Health?', 
   answer: 'Is the universal strategy to intensify interdisciplinary collaborations and communications in all aspects of health care for humans, animal and environment', distractor_1: 'Is the strategy that involves specific strategy to halt diseases that can affect only humans', distractor_2: 'Is the strategy that intensify multi-sectorial collaborations and communications in all health care aspects only for animal and environment', distractor_3:'Is the universal strategy to intensify interdisciplinary', quiz: "Quiz")

 q2 = McQuestion.create!(question: 'More people live in close contact with wild and domestic animals,and this lead to?', 
   answer: 'more opportunities for diseases to pass between animals and people.', distractor_1: 'more opportunities for prevention of diseases that can pass between animals and people.', distractor_2: 'more opportunities for diseases to pass between animals only', distractor_3:'Is the universal strategy to intensify interdisciplinary', quiz: "quiz")

 q3 = McQuestion.create!(question: 'Overall , one Health comprises of :', 
   answer: 'Economic health ,Ecosystem health ,animal health ,individual and public health', distractor_1: 'only Individual health and Public health', distractor_2: 'Neither nor animal health or Public health', distractor_3:'Is the universal strategy to intensify interdisciplinary', quiz: "quiz")

   

 q4 = McQuestion.create!(question: 'Which hash is primarily used for one way message passing from the controller to the view?', answer: 'flash', distractor_1: 'session', distractor_2: 'params', distractor_3: 'attempt', quiz: "quiz")
 q5 = McQuestion.create!(question: 'In which folder are image assets for the QuizMe app stored?', answer: 'quiz-me/app/assets/images', distractor_1: 'quiz-me', distractor_2: 'quiz-me/images', distractor_3: 'update', quiz: "quiz")
 q6 = McQuestion.create!(question: 'Which standard RESTful controller action is used to remove records?', answer: 'destroy', distractor_1: 'delete', distractor_2: 'remove', distractor_3: 'cancel', quiz: "quiz")

 q1 = McQuestion.create!(quiz: quiz1, question: 'What does the M in MVC stand for?', answer: 'Model', distractor_1: 'Media', distractor_2: 'Mode', distractor_3: 'More')
 q2 = McQuestion.create!(quiz: quiz1, question: 'What does the V in MVC stand for?', answer: 'View', distractor_1: 'Verify', distractor_2: 'Validate', distractor_3: 'Visualize')
 q3 = McQuestion.create!(quiz: quiz1, question: 'What does the C in MVC stand for?', answer: 'Controller', distractor_1: 'Create', distractor_2: 'Code', distractor_3: 'comment')

 q4 = McQuestion.create!(quiz: quiz2, question: 'Which hash is primarily used for one way message passing from the controller to the view?', answer: 'flash', distractor_1: 'session', distractor_2: 'params', distractor_3: 'mirror')
 q5 = McQuestion.create!(quiz: quiz2, question: 'In which folder are image assets for the QuizMe app stored?', answer: 'quiz-me/app/assets/images', distractor_1: 'quiz-me', distractor_2: 'quiz-me/images', distractor_3: 'exam')
 q6 = McQuestion.create!(quiz: quiz2, question: 'Which standard RESTful controller action is used to remove records?', answer: 'destroy', distractor_1: 'delete', distractor_2: 'remove', distractor_3: 'cancel')