Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :new, :create]

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#authenticate'
  get '/logout', to: 'sessions#logout'

  namespace :users do
    resources :users, only: [:show, :edit, :update]
  end

  root 'users#index'
end
