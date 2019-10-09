Rails.application.routes.draw do
  resources :clients
  resources :stylists
  resources :concierges

  root 'welcome#home'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/signout', to: 'sessions#destroy'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
