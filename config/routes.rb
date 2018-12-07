Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    #users
    get '/users' => 'users#index'
    post '/users' => 'users#create'
    get '/users/show' => 'users#show'
    patch '/users/edit' => 'users#update'
    delete '/users/:id' => 'users#destroy'
    #groups
    get '/groups' => 'groups#index'
    post '/groups' => 'groups#create'
    get '/groups/:id' => 'groups#show'
    patch '/groups/:id' => 'groups#update'
    delete '/groups/:id' => 'groups#destroy'
    #user_groups
    get '/user_groups' => 'user_groups#index'
    post 'user_groups' => 'user_groups#create'
    get '/user_groups/:id' => 'user_groups#show'
    patch '/user_groups/:id' => 'user_groups#update'
    delete '/user_groups/:id' => 'user_groups#destroy'
    #user_calendar_openings
    get '/user_calendar_openings' => 'user_calendar_openings#index'
    post '/user_calendar_openings' => 'user_calendar_openings#create'
    get '/user_calendar_openings/:id' => 'user_calendar_openings#show'
    patch '/user_calendar_openings/:id' => 'user_calendar_openings#update'
    delete 'user_calendar_openings/:id' => 'user_calendar_openings#destroy'
    #group_events
    get '/group_events' => 'group_events#index'
    post '/group_events' => 'group_events#create'
    get '/group_events/:id' => 'group_events#show'
    #user_interests
    get '/user_interests' => 'user_interests#index'
    post '/user_interests' => 'user_interests#create'
    get '/user_interests/:id' => 'user_interests#show'
    patch '/user_interests/:id/edit'=>'user_interests#update'
    #sessions
    post '/sessions' => 'sessions#create'
    #comments
    get '/comments' => 'comments#index'
    post '/comments' => 'comments#create'
    delete '/comments/:id' => 'comments#destroy'
  end

end

