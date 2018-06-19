Rails.application.routes.draw do
  
  get 'home/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resources :buyer_requirement
  resources :conversations, only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end
  namespace :website do
    resources :user
  end
  namespace :api do
    namespace :v1 do
      namespace :registration do
        post 'signup', to: 'users#create'
      end
      namespace :session do
        post 'auth/login', to: 'authentication#authenticate'
        post 'auth/logout', to: 'authentication#logout'
        put 'user_update' , to: 'authentication#update'
        get 'user_profile', to:  'authentication#user_profile'
        post 'upload_media', to:  'authentication#upload_media'
        post 'password/forgot', to: 'passwords#forgot'
        post 'password/reset', to: 'passwords#reset'
        put 'password/update', to: 'passwords#update'
        get 'confirm_email' , to: 'authentication#confirm_email'
        post 'confirm' , to: 'authentication#confirm'
      end
    end
  end
end