Rails.application.routes.draw do
  resources :articles ,  except: [:index]
  devise_for :users , :controllers => { registrations: 'registrations' }
  resources :articles ,  except: [:index] do
    resources :votes , only: [:create , :destroy]
  end
  resources :categories , only: [:show , :index]
  root to: 'categories#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
