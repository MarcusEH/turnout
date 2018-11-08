Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    #users
    get '/users' => 'users#index'
    post '/users' => 'users#create'
    get '/users/:id' => 'users#show'
    patch '/users/:id' => 'users#update'
    delete '/users/:id' => 'users#destroy'
    #groups
    get '/groups' => 'groups#index'
    post '/groups' => 'groups#create'
    get '/groups/:id' => 'groups#show'
    patch '/groups/:id' => 'groups#update'
    delete '/groups/:id' => 'groups#destroy'
    #user_groups
    get ''
  end

end

