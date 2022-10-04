Rails.application.routes.draw do
  root "pets#index"

  
  resources :pets

  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login" => "sessions#new"
  post "/sessions" => "sessions#create"
  get "/logout" => "sessions#destroy"
  # Automatically generates the following routes
  # get "/pets" => "pets#index", as: "pets"
  # get "/pets/new" => "pets#new", as: "new_photo"
  # post "/pets" => "pets#create"
  # get "/pets/:id" => "pets#show", as: "photo"
  # get "/pets/:id/edit" => "pets#edit", as: "edit_photo"
  # patch "/pets/:id" => "pets#update"
  # delete "/pets/:id" => "pets#destroy"
end
