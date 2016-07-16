Rails.application.routes.draw do


  resources :projects do
    resources :project_memberships
    resources :teams
  end

  resources :teams, only: [] do
    resources :team_memberships
  end

  resource :profiles, only: [:new, :create]

  resources :skills

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  resources :users, only: [:show] do
    resource :profile, only: [:show, :edit, :update]
  end

  root 'pages#home'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
