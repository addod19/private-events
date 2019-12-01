Rails.application.routes.draw do
  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show, :index]
  resources :sessions, only: %i[new create destroy show]
  resources :events
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  
  # get 'signout', to: 'sessions#destroy', via: 'delete'

  # match '/signin', to: 'sessions#new', via: 'post'
end
