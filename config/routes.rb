Rails.application.routes.draw do
  root 'items#index'
  get '/list', to: 'items#list'
  resources :items
  resources :users
  get '/login', to: 'user_sessions#new'
  # get '*path', to: 'items#index'
end
