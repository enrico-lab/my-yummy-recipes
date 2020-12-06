Rails.application.routes.draw do
  root to: 'pages#welcome'
  devise_for :user
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/home', to: 'pages#home'
  resources :dishes do
    resources :doses, only: [:new, :create, :destroy]
  end
end

