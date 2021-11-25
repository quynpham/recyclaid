Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard', as: :dashboard
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :materials do
    resources :buyings, only: [:show, :new, :create]
  end
  resources :users, only: [:show]
end
