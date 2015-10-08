Rails.application.routes.draw do
  resources :leaders, only: [:create, :index]
  get 'leaders/all', to: 'leaders#all'
end
