Rails.application.routes.draw do
  root to: "blogs#index"
  resources :blogs
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
end
