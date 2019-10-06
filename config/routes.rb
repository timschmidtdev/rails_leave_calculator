Rails.application.routes.draw do
  resources :employees do
    resources :plans, except: [:index]
  end

  resources :users, only: [:new, :create]

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
