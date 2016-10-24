Rails.application.routes.draw do
  devise_for :users
  resources 'institutes'
  root to: redirect('/institutes')
end
