Rails.application.routes.draw do
  resources :reviews
  resources :establishments
  resources :users

  post '/login', to: 'users#login'
  get '/persist', to: 'users#persist'
  post '/yelp-establishments', to: 'establishments#yelp_establishments'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
