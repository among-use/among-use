Rails.application.routes.draw do
<<<<<<< HEAD
  resources :events,only: %i[index create destroy edit new update]
=======
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'top#index'
>>>>>>> master

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
