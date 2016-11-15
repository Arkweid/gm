Rails.application.routes.draw do
  devise_for :users

  root 'welcom#index'
  get '/search', to: 'search#index'

  resources :users do
    resources :characters do
      resources :invites
    end

    resources :guilds
  end
end
