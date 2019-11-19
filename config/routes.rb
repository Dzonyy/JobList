Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new', as: 'signup'

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  namespace :admin do
    root to: 'jobs#index'

    get 'login', to: 'sessions#new', as: 'login'
    post 'login', to: 'sessions#create'
    get 'logout', to: 'sessions#destroy', as: 'logout'

    resources :jobs, except: :show
    resources :employees, except: :show
    resources :users, except: :show
  end
end
