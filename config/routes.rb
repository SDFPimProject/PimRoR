Rails.application.routes.draw do

  resources :invites
  resources :users_projects
  resources :users_teams
  resources :events
  resources :projects
  resources :teams
  resources :subscribe_calendar
  devise_for :users, controllers: {registrations: 'users/registrations', :sessions => "users/sessions"}
  root 'welcome#index'

  # Routes for Login/Devise
  devise_scope :user do
    get 'users/edit' => 'users/registrations#edit' #, :as => 'edit_user_registration'
    put 'users/edit' => 'users/registrations#update', :as => 'update_user_registration'
    put 'users' => 'devise/registrations#update' #, :as => 'user_registration'
    get 'users/create' => 'users/registrations#new' #, :as => 'new_user_registration'
  end

  resources :user, :controller => "users/users"
  
  

  resources :conversations do
    resources :messages
  end

  get 'users/:id/show' =>'users/users#show', :as => 'show_users_path'
  get 'user_search', to: 'users/users#search'

  get 'conservations_list', to: 'conversations#get_conservation_list'
  get 'conversation_landingpage', to: 'conversations#get_landing_page'
  post 'messages_read', to: "messages#message_read"
  post 'message_receive', to: "messages#message_receive"

  post 'teams/:teamid/user/:userid/remove' => 'teams#removeUser', :as => 'team_remove_user'
  post 'teams/:teamid/user/:userid/add' => 'teams#addUser', :as =>'team_add_user'

  post 'projects/:projectid/user/:userid/remove' => 'projects#removeUser', :as => 'project_remove_user'
  post 'projects/:projectid/user/:userid/add' => 'projects#addUser', :as => 'project_add_user'

  get 'calendar_subscribe/:id/subscribe' =>'subscribe_calendar#subscribe', :as => 'subscribe_to_calendar_path'
  get 'calendar_subscribe/:id/delete' =>'subscribe_calendar#delete', :as => 'delete_subscribtion_path'

  get 'events/:id/subscribed' =>'events#subscribed', :as => 'subscribed_events_path'
end