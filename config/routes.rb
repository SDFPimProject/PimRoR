Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations', :sessions => "users/sessions" }
  resources :projects
  resources :teams
  root 'welcome#index'

  # Routes for Login/Devise
  as :user do
    get 'users/edit' => 'users/registrations#edit', :as => 'edit_user_registration'
    put 'users/edit' => 'users/registrations#update', :as => 'update_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
    get 'users/create' => 'users/registrations#new' , :as => 'new_user_registration'
  end

end
