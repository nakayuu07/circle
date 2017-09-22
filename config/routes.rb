Rails.application.routes.draw do
  devise_for :users

  resources :collections

  root 'top#index'
end
