Rails.application.routes.draw do
  resources :employees do
    resources :plans, except: [:index]
  end

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
