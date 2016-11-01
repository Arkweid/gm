Rails.application.routes.draw do
  devise_for :users

  root 'welcom#index'

  resources :characters
end
