Rails.application.routes.draw do
  root "blogs#index"
  get '/signup' => "users#new"
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :blogs
  resources :account_activations, only: [:edit]
end
