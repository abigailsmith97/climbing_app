

Rails.application.routes.draw do 
  get 'pages/home'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  
  get "up" => "rails/health#show", as: :rails_health_check
  get 'users/new'
  get 'users/create'

  resources :users, only: [:create, :new, :show]
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'pages#home' 


end

