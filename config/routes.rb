Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get "todos", to: "todos#index" 
  # post "todos/create", to: "todos#create"
  # get "todos/:id", to: "todos#show"
  resources "todos"
  # get "users", to: "users#index"
  # get "public/todos"
  post "users/login", to: "users#login"
  resources "users"

  # get "todos/create", to: "todos#create"
end
