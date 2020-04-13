Rails.application.routes.draw do
  resources :users
  resources :posts
  get 'course/assesment'
  get 'welcome/index'
  get 'logins/login'
  root 'welcome#index'
  resources :account_activations, only: [:edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
