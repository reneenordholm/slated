Rails.application.routes.draw do
  resources :clients
  resources :stylists
  resources :concierges

  root 'welcome#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
