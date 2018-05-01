Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
}

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :notifications, only: [:index]
  resources :relationships, only: [:create, :destroy]
  resources :users, only: [:show, :index]
  resources :collections do
   resources :comments
   resources :joins, only: [:index, :create, :destroy]
   resources :keeps, only: [:create, :destroy]
  end
  resources :conversations do
    resources :messages
  end

  root to: 'tops#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
