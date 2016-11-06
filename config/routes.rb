Rails.application.routes.draw do
  devise_for :users

  root 'welcom#index'

  resources :users do
    resources :characters
  end
end
