Rails.application.routes.draw do
  devise_for :users
  root 'accounts#index'

  resources :accounts

  resources :boards do
    resources :artists
  end

  resources :artists do
    resources :songs
  end
end
