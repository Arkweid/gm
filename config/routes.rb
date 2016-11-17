Rails.application.routes.draw do
  devise_for :users

  root 'welcom#index'
  get '/search', to: 'search#index'

  resources :users do
    get '/characters/invites', to: 'invites#index'
    get '/characters/invites/new', to: 'invites#new'    

    resources :characters do
      resources :invites
    end

    resources :guilds
  end
end
