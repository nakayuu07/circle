Rails.application.routes.draw do

  get 'relationships/create'

  get 'relationships/destroy'

  resources :users, only: [:index]

   resources :relationships, only: [:create, :destroy]

  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
}
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :collections do
   resources :comments
  end

  root 'top#index'

end
