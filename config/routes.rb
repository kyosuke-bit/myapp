Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'mypage', to: 'users#mypage'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index'
  resources :users, only: %i[show new create edit update] do
    member do
      get :following, :followers, :favorites
    end
  end
  resources :relationships, only: [:create, :destroy]
  resource :profile
  resources :posts do
    resources :favorites, only: %i[create destroy] do
    end
    resources :comments, only: %i[create destroy] do
      resources :goods, only: %i[create destroy]
    end
  end

  resources :rooms, only: %i[create show] do
    resources :messages, only: %i[create destroy]
  end

  # ルーティングの規約により一番最後に記載
  get ':name', to: 'users#show', as: 'userpage'
end
