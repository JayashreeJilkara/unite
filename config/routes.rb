Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#new'
  get 'log_out', to: 'sessions#destroy'
  post 'log_in', to: 'sessions#create'
  resources :users, only: [:create]
end
