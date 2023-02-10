Rails.application.routes.draw do
  resources :users, only: [:create]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  #product routes
  get'/products', to:'products#index'
  get'/products/:id', to:'products#show'
  put'update', to:'products#update'
  post'/new', to:'products#create'
  delete'/remove', to:'products#destroy'
  

  # Defines the root path route ("/")
  # root "articles#index"
end
