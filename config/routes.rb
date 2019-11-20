Rails.application.routes.draw do
  devise_for :users
  devise_for :employees

  root 'home#index'

  namespace :admin do
    root to: 'jobs#index'
    resources :jobs, except: :show
    resources :employees, except: :show
    resources :users, except: :show
  end
end
