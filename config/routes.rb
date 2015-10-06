Rails.application.routes.draw do
  resources :leaders, only: [:create, :index]
end
