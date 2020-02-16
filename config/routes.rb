Rails.application.routes.draw do
  devise_for :users
  devise_for :employees

  root "home#index"

  get "jobs/:slug", to: "jobs#job_modal", as: :job_modal
  get '/new-job', to: 'jobs#new', as: :new_job

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
