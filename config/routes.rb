Rails.application.routes.draw do

  resource :profiles, only: [:new, :create]

  resources :skills

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  resources :users, only: [] do
    resource :profile, only: [:show, :edit, :update]
  end

  root 'pages#home'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
