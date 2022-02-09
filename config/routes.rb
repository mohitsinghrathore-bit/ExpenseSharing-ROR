Rails.application.routes.draw do

  #User Routes
  get '/user', to:'user#show'
  post '/user', to:'user#create'

  #Group Routes
  post '/group', to:'group#create'

  #Transaction Routes
  put '/txn', to:'transaction#doTransaction'


end
