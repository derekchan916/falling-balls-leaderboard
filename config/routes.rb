Rails.application.routes.draw do
  resources :leaders, only: [:create, :index]
  resources :leaders do
    member do
      get 'all'
    end
  end
end
