Rails.application.routes.draw do
  resources :reviews
  resources :establishments
  resources :users, only: [:create]

  post '/login', to: 'users#login'
  get 'establishments/:id', to: 'establishments#show'
  get '/persist', to: 'users#persist'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
