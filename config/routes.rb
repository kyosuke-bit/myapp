Rails.application.routes.draw do
  get 'mypage', to: 'users#mypage'
  get '/:name', to: 'users#show'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  # root 'home#index'
  resources :users, only: %i[show new create] do
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
end
