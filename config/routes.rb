Rails.application.routes.draw do
  resources :users
  root 'top#index'
  resource :login, only: %i[ new create ]
  resource :logout, only: %i[ show ]

  resources :welcomes, only: :index
end
