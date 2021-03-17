Rails.application.routes.draw do
  devise_for :users
 root to: 'pictures#index'
 resources :pictures do
  resources :comments, omly: :create
  collection do
    get 'search'
  end
 end
 resources :users, only: :show
end
