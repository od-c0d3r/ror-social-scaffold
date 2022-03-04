Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root 'posts#index'
  get 'friendships/create'
  get 'my_friends', to: 'users#my_friends'
  get 'requests', to: 'users#requests'

  devise_for :users
  namespace :api do
    namespace :v1 do
      post :auth, to 'authentication#create'
      post :register, to: 'registrations#create'
      resources :posts, only: [:index, :create] do
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
