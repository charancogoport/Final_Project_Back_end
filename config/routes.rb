Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"
  get '/login/(:id)', to: 'pages#login'
  get '/posts/(:id)', to: 'pages#posts'
  get '/search/(:title)', to: 'pages#search'
  post '/inputpost', to:'pages#inputpost'
  put '/editpost', to:'pages#editpost'
  get 'likes', to:'pages#likes'
  
end


