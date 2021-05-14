Rails.application.routes.draw do
  
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
