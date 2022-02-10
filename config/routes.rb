Rails.application.routes.draw do

  #User Routes
  get '/user', to:'user#show'
  post '/user', to:'user#create'
  get  '/user/:id',to:'user#balanceAtUserlevel'

  #Group Routes
  post '/group', to:'group#create'
  get  '/group/:id', to:'group#balanceAtGrouplevel'
  get  '/grp/:id', to:'group#datewiseSegregation'

  #Transaction Routes
  put '/txn', to:'transaction#doTransaction'

end
