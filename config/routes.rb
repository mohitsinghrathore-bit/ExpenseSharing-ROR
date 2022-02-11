Rails.application.routes.draw do

  #User Routes
  get '/user', to:'user#show'
  post '/user', to:'user#create'
  get  '/user/:id',to:'user#balance_at_user_level'
  put  '/user/:id',to:'user#update_user'

  #Group Routes
  post '/group', to:'group#create'
  get  '/group/:id', to:'group#balance_at_group_level'
  get  '/grp/:id', to:'group#datewise_segregation'

  #Transaction Routes
  put '/txn', to:'transaction#do_transaction'

end
