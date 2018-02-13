Rails.application.routes.draw do


  get 'notifications/index'

   resources :relationships, only: [:create, :destroy]

  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
}

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :users, only: [:show, :index]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :collections do
   resources :comments
   resources :joins, only: [:index, :create, :destroy]
   resources :keeps, only: [:create, :destroy]
  end

  resources :conversations do
    resources :messages
  end

  root to: 'top#index'

end
