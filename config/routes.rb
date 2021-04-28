Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'homes/about'
  # get 'about' => 'homes#about'
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:index, :show, :create, :edit, :update, :destroy]
end
