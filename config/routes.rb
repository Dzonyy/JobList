Rails.application.routes.draw do
  devise_for :users
  devise_for :employees

  root "home#index"

  # get 'job/:slug', to: 'jobs#show', as: :job
  get "job/:slug", to: "jobs#job_modal", as: :job_modal

  get "pricing", to: "pricings#index", as: :pricing

  namespace :admin do
    root to: "jobs#index"

    resources :jobs, except: :show
    resources :employees, except: :show
    resources :users, except: :show
    resources :technologies, except: :show
    resources :categories, except: :show
    resources :benefits, except: :show
    resources :pricings, except: :show
  end
end
