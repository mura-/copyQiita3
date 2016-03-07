Rails.application.routes.draw do
  devise_for :users
  resources :items do
    resources :comments
  end
  resources :stocks, only: [:create, :destroy]
  root 'items#index'

end
