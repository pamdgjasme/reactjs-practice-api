# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :admin do
      post '/login', to: 'sessions#create'

      resources :users
      resources :listings
    end
  end
end
