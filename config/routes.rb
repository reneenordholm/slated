Rails.application.routes.draw do
  
  resources :stylists do
    resources :appointments
  end
  
  resources :appointments
  resources :clients
  resources :concierges
  resources :services
  resources :stylists

  root 'welcome#home'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/signout', to: 'sessions#destroy'




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
