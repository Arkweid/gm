Rails.application.routes.draw do
  devise_for :users

  root 'welcom#index'
  get '/search', to: 'search#index'

  resources :users do
    resources :characters
    resources :guilds
    resources :invites do
      post 'reject', on: :member
    end
  end

  namespace :guild_panel do
    resource :administration, only: :show
    resource :guild
    resources :news
    resources :characters, only: [:index, :show]
    resources :character_privelegies
  end
end
