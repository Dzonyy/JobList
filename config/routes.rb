Rails.application.routes.draw do
  devise_for :users
  devise_for :employees

  root "home#index"

  get "jobs/:slug", to: "jobs#job_modal", as: :job_modal
  get "/new-job/step-1", to: "jobs#new", as: :new_job
  post "/new-job", to: "jobs#create", as: :create_job
  get "/new-job/job-payment", to: "jobs#payment", as: :job_pricing
  get "/new-job/confirmation", to: "jobs#confirmation", as: :job_confirmation

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
