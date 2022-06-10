Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"
  get '/login/(:id)', to: 'pages#login'
  get '/posts/(:id)', to: 'pages#posts'
  post '/createpost', to: 'pages#createpost'
  get '/search/(:title)', to: 'pages#search'
  post '/inputpost/(:user_id)', to:'pages#inputpost'
  put '/editpost/(:id)', to:'pages#editpost'
  get 'likes/(:id)', to:'pages#likes'
  delete '/deletepost/(:id)', to:'pages#deletepost'

end




