RottenMangoes::Application.routes.draw do

      resources :movies do
        resources :reviews, only: [:new, :create]
      end
      resources :users, only: [:new, :create]
      resources :sessions, only: [:new, :create, :destroy]
      root to: 'movies#index'

      resource :profile

      namespace :admin do
        resources :movies
          resources :reviews, only: [:new, :create]
      end
end
