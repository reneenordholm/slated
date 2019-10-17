Rails.application.routes.draw do
  
  resources :stylists, only: [:index, :new, :create, :edit, :update] do
    resources :appointments, only: [:new, :index, :show, :create]
  end

  resources :clients, only: [:index, :new, :create, :edit, :update] do
    resources :appointments, only: [:new, :index, :show, :create]
  end
  
  resources :appointments
  resources :concierges, only: [:create, :show, :edit, :update]
  resources :services, only: [:index, :show, :new, :create, :edit, :update]


  root 'welcome#home'

  get '/signup', to: 'concierges#new'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/signout', to: 'sessions#destroy'

  get "/auth/:provider/callback", to: "sessions#google_auth"
  get 'auth/failure', to: redirect('/')



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
