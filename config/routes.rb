Rails.application.routes.draw do

  get '/user', to:'user#show'
  post '/user', to:'user#create'
  post '/group', to:'group#create'
end
