Rails.application.routes.draw do
  
  resources :stylists, only: [:index, :show] do
    resources :appointments, only: [:new]
  end

  resources :clients, only: [:index, :show] do
    resources :appointments, only: [:new]
  end
  
  resources :appointments
  resources :concierges, only: [:new, :create, :show]
  resources :services, only: [:index, :show]


  root 'welcome#home'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/signout', to: 'sessions#destroy'




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
