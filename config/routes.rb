Rails.application.routes.draw do
  root "blogs#index"
  get "blogs/show" => "blogs#show"
  post "blogs/new" => "blogs#new"
  post "blogs" => "blogs#create"
end
