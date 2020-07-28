Rails.application.routes.draw do
  root 'items#index'
  get '*path', to: 'items#index'
  resources :users
  get '/login', to: 'user_sessions#new'
end
