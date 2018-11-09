Rails.application.routes.draw do
  resources :powers, only: [:index, :show]
  # get '/heroines/search', to: 'heroines#search'
  resources :heroines, only: [:index, :show, :new, :create]
end
