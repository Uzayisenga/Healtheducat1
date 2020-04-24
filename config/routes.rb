Rails.application.routes.draw do
  resources :results
  resources :assesments
  resources :quizzes
  resources :mc_questions
  resources :exams
  resources :courses
  resources :users
  resources :posts
  get 'course/assesment'
  get 'welcome/index'
  get 'logins/login'
  root 'welcome#index'
  resources :account_activations, only: [:edit]
  resources :quizzes do
    resources :mc_questions
  end
end
