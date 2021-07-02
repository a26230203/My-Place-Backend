Rails.application.routes.draw do
  resources :jouranl_images
  resources :journal_drafts
  resources :journals
  resources :albums
  resources :photos
  resources :users

  post "/login", to: "users#login"
  post "/signup", to: "users#create"

  post '/upload', to: "jouranl_images#upload"
  post '/photo', to: "photos#upload"
  post '/photoupload', to: "photos#photo_upload"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
