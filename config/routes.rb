Rails.application.routes.draw do
  resources :employees do
    resources :plans, except: [:index]
  end

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  root 'welcome#index'
end
