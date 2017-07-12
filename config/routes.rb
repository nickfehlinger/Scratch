Rails.application.routes.draw do
  root 'home#index'
  post '/signin' => 'application#signin'
  get '/signout' => 'application#signout'
  get '/search' => 'home#search', as: 'search'
  resources :post_categories

  resources :categories

  resources :posts do
  	  resources :comments
  	  resources :favorites
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
