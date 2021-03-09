Rails.application.routes.draw do
  resources :articles
  devise_for :users
  resources :users 
  resources :articles do
    resources :votes , only: [:create , :destroy]
  end
  root to: 'articles#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
