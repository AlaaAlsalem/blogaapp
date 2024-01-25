Rails.application.routes.draw do
 
  get '/user', to: 'user#index', as: 'users'
  
  get '/user/:id', to: 'user#show', as: 'user'

  get '/posts/', to: 'post#index'
  get '/posts/show', to: 'post#show'

end
