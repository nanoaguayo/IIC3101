Rails.application.routes.draw do
  root 'home#index'
  get '/admin' => 'admin#home'
  get 'admin/creator' => 'admin#creator'
  resources :news
  resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
