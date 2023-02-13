Rails.application.routes.draw do
  resources :users
  resources :orders 
  resources :users, only: [:create]
  resources :carts, only: [:index, :create, :update]

  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  #product routes
  get'/products', to:'products#index'
  get'/products/:id', to:'products#show'
  put'update', to:'products#update'
  post'/new', to:'products#create'
  delete'/remove', to:'products#destroy'
  
  #category routes
  get'/categories',to:'categories#index'
  get'categories/:id',to:'categories#show'
  post'/add-category',to:'categories#create'
  put'update-category', to:'categories#update'
  delete'/remove-category',to:'categories#destroy'

 
  # Defines the root path route ("/")
  # root "articles#index"
end
