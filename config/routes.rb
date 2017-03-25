Rails.application.routes.draw do
  get 'usuarios/index'

  root 'home#index'
  get '/admin' => 'admin#home'
  post 'news/new' => 'news#create'
  resources :news
  resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #REST API
  get '/usuario' => 'usuarios#index'
  get '/usuario/:id' => 'usuarios#show'
  post '/usuario/:uid' => 'usuarios#edit'
  delete '/usuario/:id' => 'usuarios#delete'
  put  '/usuario' => 'usuarios#create'
end
