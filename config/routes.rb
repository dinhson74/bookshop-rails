Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    devise_for :users, :controllers => {
      :registrations => 'users/registrations',
      :sessions => 'users/sessions'
    }

    devise_scope :user do
      post 'users/sign_in', to: 'devise/sessions#create'
      # post 'users/sign_up', to: 'devise/registrations#create'
      # get 'users/:id/edit', to: 'users/registrations#edit', as: :edit_other_user_registration
      # match 'users/:id', to: 'users/registrations#update', via: [:patch, :put, :destroy], as: :other_user_registration
      # delete 'users/:id', to: 'users/registrations#destroy', as: :destroy_other_user_registration
    end
    root 'static_pages#home'
    resources :books, only: [:index]
    resources :users, only: [:show]
    resources :books do
      resources :comments
    end
    namespace :admin do
      resources :users do
        collection {post :import}
      end

      resources :books do
        collection {post :import}
      end

      resources :categories do
        collection {post :import}
      end

      root 'dashboard#index'
    end
  end
end
