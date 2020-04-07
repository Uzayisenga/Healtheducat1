Rails.application.routes.draw do
  devise_for :users
  get 'course/assesment'
  get 'welcome/index'
  root 'welcome#index'
  resources :account_activations, only: [:edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
