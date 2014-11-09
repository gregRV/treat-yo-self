Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show] do
    resources :tasks, only: [:new, :create, :show]
    resources :treats, only: [:new, :create, :show]
  end

  resources :sessions, only: [:new, :create, :destroy]

  root 'sessions#new'
end
