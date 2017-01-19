Rails.application.routes.draw do
  devise_for :users

  root 'welcom#index'
  get '/search', to: 'search#index'

  resources :users do
    resources :characters
    resources :guilds
    resources :invites do
      patch 'reject', on: :member
    end
  end

  namespace :guild_panel do
    resource :administration, only: :show
    resource :guild
    resources :news
    resources :characters, only: [:index] do
      patch 'grant_privilege', on: :member
      patch 'remove_privilege', on: :member
      delete 'kick', on: :member
      patch 'up_rank', on: :member
      patch 'down_rank', on: :member
    end
    resources :invites, only: [:index] do
      patch 'approval', on: :member
      patch 'reject', on: :member
      patch 'accepted', on: :member
    end
  end
end
