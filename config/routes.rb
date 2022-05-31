Rails.application.routes.draw do
  get 'mypage', to: 'users#mypage'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  # root 'home#index'
  resources :users, only: %i[show new create edit update] do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resource :profile
  resources :posts do
    resources :favorites, only: %i[create destroy]
    resources :comments, only: %i[create destroy] do
      resources :goods, only: %i[create destroy]
    end
  end
  # resources :messages, only: %i[create destroy]
  # resources :rooms, only: %i[create show]

  resources :rooms, only: %i[create show] do
    resources :messages, only: %i[create destroy]
  end

  # ルーティングの規約により一番最後に記載
  get ':name', to: 'users#show', as: 'userpage'
end
