Rails.application.routes.draw do
  devise_for :users

  root 'welcom#index'
  get '/search', to: 'search#index'

  resources :users do
    resources :characters
    resources :guilds
  end
end
