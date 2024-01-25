# config/routes.rb

Rails.application.routes.draw do
  # For the index action
  get '/user', to: 'user#index', as: 'users'
  
  # For the show action
  get '/user/:id', to: 'user#show', as: 'user'
end
