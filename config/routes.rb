Minicms::Application.routes.draw do

  devise_for :users, :controllers => {
  :registrations => 'users/registrations'
  }

  devise_scope :user do 
    match "organizations/:id/users/new", :via => :get, :to => "users/registrations#next_new_user"
    match "organizations/:id/users/new", :via => :post, :to => "users/registrations#create_next_new_user", :as => "create_next_new_user"
    match "organizations/:id/users", :via => :get, :to => "users/registrations#index", :as => "users"
  end

  resources :organizations, :only => [:edit, :update]
  #match "organizations/:id", :via => :get, :to => "organizations#edit", :as => "organizations_edit"
  #match "organizations/:id", :via => :put, :to => "organizations#update", :as => "organizations_update"

  match "organizations/:id/organization_infos", :via => :get, :to => "organization_infos#edit", :as => "edit_organization_infos"
  match "organizations/:id/organization_infos", :via => :put, :to => "organization_infos#update", :as => "organization_infos"

  match "organizations/:id/homepage", :via => :get, :to => "homepages#preview", :as => "organizations_homepage"

  match "organizations/:id/view_design", :via => :get, :to => "view_designs#edit", :as => "view_designs"
  match "organizations/:id/view_design", :via => :put, :to => "view_designs#update", :as => "view_designs"

  match "organizations/:id/image", :via => :get, :to => "images#edit", :as => "organization_image"
  match "organizations/:id/image", :via => :put, :to => "images#update", :as => "images"

  root :to => "homepages#show"
end
