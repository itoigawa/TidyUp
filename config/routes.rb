Rails.application.routes.draw do
  root 'items#index'
  get '*path', to: 'items#index'
end
