Rails.application.routes.draw do
  root 'home#index'
  get '/admin' => 'admin#home'
  post 'news/new' => 'news#create'
  resources :news
  resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
