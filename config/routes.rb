Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }, skip: :sessions
  devise_for :employees, only: %i[sessions passwords]

  devise_scope :user do
    get 'logowanie', to: 'devise/sessions#new', as: :new_user_session
    post 'logowanie', to: 'devise/sessions#create', as: :user_session
    delete 'wyloguj', to: 'devise/sessions#destroy', as: :destroy_user_session

    # get 'rejestracja', to: 'devise/registrations#new', as: :new_user_registration
    # post 'rejestracja', to: 'devise/registrations#create', as: :user_registration
  end

  root 'home#index'

  namespace :admin do
    root to: 'jobs#index'
    resources :jobs, except: :show
    resources :employees, except: :show
    resources :users, except: :show
  end
end
