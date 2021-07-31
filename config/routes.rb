Rails.application.routes.draw do

  resources :participants,  only: [:index, :create, :destroy]

  root 'top#index'

  resources :events,only: %i[index create destroy edit new update]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :profiles, only: %i[new]

  post "oauth/callback", to: "oauths#callback"
  get "oauth/callback", to: "oauths#callback"
  get "oauth/:provider", to: "oauths#oauth", as: :auth_at_provider

  # Users
  resources :users
end
