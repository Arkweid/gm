Rails.application.routes.draw do
  devise_for :users

  root 'welcom#index'
  get '/search', to: 'search#index'

  resources :users do
    resources :characters
      patch 'grant_privilege', on: :member
      delete 'remove_privilege', on: :member    
    resources :guilds
    resources :invites do
      patch 'reject', on: :member
      patch 'accepted', on: :member
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
