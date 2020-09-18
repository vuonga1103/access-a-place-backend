Rails.application.routes.draw do
  resources :reviews
  resources :establishments
  resources :users

  post '/login', to: 'users#login'
  get '/persist', to: 'users#persist'
  post 'establishments/get-rating-and-review-count', to: 'establishments#get_rating_and_review_count'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
