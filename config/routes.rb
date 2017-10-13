Rails.application.routes.draw do

   resources :relationships, only: [:create, :destroy]

  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
}

  resources :users, only: [:show]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :collections do
   resources :comments
   resources :joins, only: [:create, :destroy]
  end

  root 'top#index'

end
