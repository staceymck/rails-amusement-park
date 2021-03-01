Rails.application.routes.draw do
  resources :users, except: [:destroy, :update, :edit]
  resources :attractions
  resources :rides, only: [:create]
  root 'welcome#home'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
end
