Rails.application.routes.draw do

  root 'top#index'

  resources :users  
  resources :events,only: %i[index create destroy edit new update]
  resources :participants,  only: [:index, :create, :destroy]
  resources :profiles, only: %i[new]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  post "oauth/callback", to: "oauths#callback"
  get "oauth/callback", to: "oauths#callback"
  get "oauth/:provider", to: "oauths#oauth", as: :auth_at_provider
  get "top/terms", to: "top#terms"
  get "top/privacy", to: "top#privacy"
end
