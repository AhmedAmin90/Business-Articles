Rails.application.routes.draw do
  resources :articles 
  devise_for :users , :controllers => { registrations: 'registrations' }
  resources :users 
  resources :articles do
    resources :votes , only: [:create , :destroy]
  end
  resources :categories 
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
