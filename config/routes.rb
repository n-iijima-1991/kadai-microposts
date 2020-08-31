Rails.application.routes.draw do
  root to: 'microposts#index'
  resources :microposts, only: [:index, :new, :create, :destroy]

  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
end
