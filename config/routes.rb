Rails.application.routes.draw do

  resources :users_projects
  resources :users_teams
  resources :projects
  resources :teams
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

  get 'conservations_list', to: 'conversations#get_conservation_list'
  post 'messages_read', to: "messages#message_read"
  post 'message_receive', to: "messages#message_receive"

  post 'teams/:teamid/user/:userid/remove' => 'teams#removeUser', :as => 'team_remove_user'
  post 'teams/:teamid/user/:userid/add' => 'teams#addUser', :as =>'team_add_user'
  
  post 'projects/:projectid/user/:userid/remove' => 'projects#removeUser', :as => 'project_remove_user'
  post 'projects/:projectid/user/:userid/add' => 'projects#addUser', :as => 'project_add_user'
end