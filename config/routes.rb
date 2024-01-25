# config/routes.rb

Rails.application.routes.draw do
  # For the index action
  get '/user', to: 'user#index', as: 'users'
  
  # For the show action
  get '/user/:id', to: 'user#show', as: 'user'

  get '/posts/', to: 'post#index'
  get '/posts/show', to: 'post#show'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
end
