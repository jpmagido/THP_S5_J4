Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  get 'sessions/profile', to: 'sessions#profile'
  get 'gossips/index'
  get 'gossips/new'
  get 'gossips/edit'
  get 'gossips/show'

  resources :gossips
  

  resources :users
  get 'users/show'
  get 'users/index'
  
  resources :cities
  get 'cities/show'

  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'
  get '/home/:id', to: 'static#home_id'
  get '/home', to: 'static#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

