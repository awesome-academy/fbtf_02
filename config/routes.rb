Rails.application.routes.draw do
  root "static_pages#home"

  get "/index", to: "travellings#index"
  get "/show", to: "travellings#show"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  namespace :admin do
    root "static_pages#show"
    get "/locations", to: "locations#index"
    post "/locations", to: "locations#create"
    resources :users, only: %i(index destroy show)
    resources :locations, except: :show
    resources :travellings, except: :show
    resources :tours, except: :show
    resources :bookings, only: %i(index update)
  end
  resources :users
  resources :travellings
  resources :tours
  resources :reviews

  post "/like", to: "likes#create"
  delete "/unlike", to: "likes#destroy"

  resources :bookings, only: [:new, :create]
  delete "/delete", to: "bookings#destroy"
end
