Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'search#index'

  devise_for :users
  resources :users, only: [:show]
  resources :artists, :search
  resources :releases do
    resources :reviews
  end
end
