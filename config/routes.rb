Rails.application.routes.draw do
  root 'posts#index'
  get 'friendships/create'
  get 'my_friends', to: 'users#my_friends'
  get 'requests', to: 'users#requests'

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :posts, only: [:index] do
        resources :comments, only: [:index, :create]
      end
    end
  end

  resources :users, only: [:index, :show]
  resources :friendships, only: [:new, :create, :update, :destroy]
  
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
end
