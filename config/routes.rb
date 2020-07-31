Rails.application.routes.draw do
  root 'items#index'
  resources :items
  resources :users
  get '/login', to: 'user_sessions#new'
end
