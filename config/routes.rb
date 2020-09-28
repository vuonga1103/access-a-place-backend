Rails.application.routes.draw do
  resources :bookmarks
  resources :reviews
  resources :establishments
  resources :users

  post '/login', to: 'users#login'
  get '/persist', to: 'users#persist'
  post 'auth/request', to:'users#get_authorization'

  post '/yelp-establishments', to: 'establishments#yelp_establishments'
  post '/yelp-establishment', to: 'establishments#yelp_establishment'

  get '/user-bookmarks', to: 'bookmarks#user_bookmarks'
  post '/add-or-remove-bookmark', to: 'bookmarks#add_or_remove_bookmark'
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
