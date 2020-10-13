Rails.application.routes.draw do
  root 'home#index'
  namespace :api do
    resources :items, shallow: true do
      resources :wearing_times, only: %i[create]
      get 'delete_list', on: :collection
    end
    resources :sessions
    resources :users, only: %i[create] do
      collection do
        get 'me'
      end
    end
  end
  get '*path', to: 'home#index', constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }
end
