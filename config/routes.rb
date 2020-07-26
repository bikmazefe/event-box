Rails.application.routes.draw do
  resources :users
  resources :events
  resources :invitations
  root to: 'sessions#welcome'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get '/logout', to: "sessions#destroy"
  get 'events/:id/invitations/new', to: "invitations#new"
  post '/invitations/accept/:id', to: "invitations#accept"
  post '/invitations/decline/:id', to: "invitations#decline"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
