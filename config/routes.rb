Rails.application.routes.draw do
  authenticated :user do
    root 'pages#home', as: :authenticated_root
  end
  root to: 'pages#welcome'
  devise_for :user
  # get '/home', to: 'pages#home'
  resources :dishes do
    resources :doses, only: [:new, :create, :destroy]
  end
  resources :doses do
    resources :ingredients, only: [:index, :show]
  end
end

