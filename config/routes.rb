Rails.application.routes.draw do
  get 'users/new'
  root 'items#index'
  # get '*path', to: 'items#index'
  resources :users
end
