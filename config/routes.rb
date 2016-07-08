Rails.application.routes.draw do

  resource :profiles, only: [:new, :create]

  resources :users, only: [:show] do
    resource :profile, only: [:show, :edit, :update]
  end

  resources :skills

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  root 'pages#home'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
