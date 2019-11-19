Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'customers/registrations' }, skip: :sessions
  devise_for :employees, only: %i[sessions passwords]
  root 'home#index'

  namespace :admin do
    root to: 'jobs#index'
    resources :jobs, except: :show
    resources :employees, except: :show
    resources :users, except: :show
  end
end
