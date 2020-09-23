Rails.application.routes.draw do
  resources :reviews
  resources :establishments
  resources :users

  post '/login', to: 'users#login'
  post '/oauth-login', to: 'users#oauth_login' 
  get '/persist', to: 'users#persist'
  post '/yelp-establishments', to: 'establishments#yelp_establishments'
  post '/yelp-establishment', to: 'establishments#yelp_establishment'
  


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
