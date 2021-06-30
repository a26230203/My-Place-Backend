Rails.application.routes.draw do
  resources :journal_drafts
  resources :journals
  resources :albums
  resources :photos
  resources :users

  post "/login", to: "users#login"
  post "/signup", to: "users#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
