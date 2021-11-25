Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'artists#index'

  resources :artists, :search, :users
  resources :releases do
    resources :reviews
  end
end
