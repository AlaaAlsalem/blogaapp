Rails.application.routes.draw do
  #root "users#index"
 
root "users#index"

resources :users, only: [:index, :show] do
  resources :posts, only: [:index, :show, :new, :create] do
    resources :comments, only: [:new, :create]
    resources :likes, only: [:new, :create]
  end
end
  
end
