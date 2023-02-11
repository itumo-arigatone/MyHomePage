Rails.application.routes.draw do
  get 'users/new' => "users#new"
  root "blogs#index"
  resources :blogs
end
