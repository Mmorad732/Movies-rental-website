Rails.application.routes.draw do
    #get 'movies/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'

  get 'pages/about'

  resources :movies

  resources :users do 
  	resources :rentals
  end

  resources :sessions, only: [:create, :new, :destroy]
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'

  
  
end
