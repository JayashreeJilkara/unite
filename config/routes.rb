Rails.application.routes.draw do
  devise_for :users
  resources 'institutes' do
    resources 'reviews', only: [:create, :destroy]
  end
  root to: redirect('/institutes')
  get 'my_institutes', to: 'institutes#my_institutes'
end
