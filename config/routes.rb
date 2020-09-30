Rails.application.routes.draw do
  root 'home#index'
  namespace :api do
    resources :items do
      resources :wearing_times, only: %i[index create]
    end
    resources :sessions
    resources :users do
      collection do
        get 'me'
      end
    end
  end
  get '*path', to: 'home#index', constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }
end
