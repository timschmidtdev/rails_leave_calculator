Rails.application.routes.draw do
  resources :plans

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
