Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"
  post '/create', to: 'pages#create'
  get '/login/(:id)', to: 'pages#login'
  get '/posts/(:id)', to: 'pages#posts'
  post '/createpost', to: 'pages#createpost'
  get '/search/(:title)', to: 'pages#search'
  post '/inputpost/(:user_id)', to:'pages#inputpost'
  post '/profile', to:'pages#profile'
  put '/editpost/(:id)', to:'pages#editpost'
  get 'likes/(:id)', to:'pages#likes'
  delete '/deletepost/(:id)', to:'pages#deletepost'
  get 'trending', to: 'pages#trending'
  get '/userposts/(:id)', to: 'pages#userposts'
  get '/saved/(:id)', to: 'pages#saved'

end




