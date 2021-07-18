Rails.application.routes.draw do
  resources :events,only: %i[index create destroy edit new update]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
