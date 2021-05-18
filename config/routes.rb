Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'homes/about'
  # get 'about' => 'homes#about'

  # resources :users, only: [:index, :show, :edit, :update] do
  #   resources :relationships, only: [:create, :destroy]
  #   get :follows, on: :member
  #   get :followers, on: :member
  # end
  resources :users, only: [:index, :show, :edit, :update] do
    get :search, on: :collection
  end

  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す



  resources :books, only: [:index, :show, :create, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
end
