Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :todos
  # Defines the root path route ("/")
  root "todos#index"
end
