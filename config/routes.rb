Rails.application.routes.draw do
  root 'top#index'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  # Users
  resources :users, only: %i[new create]
end
