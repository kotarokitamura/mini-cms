Minicms::Application.routes.draw do

  devise_for :users, :controllers => {
  :registrations => 'users/registrations'
  }

  devise_scope :user do 
    match "organizations/users/new", :via => :get, :to => "users/registrations#next_new_user"
    match "organizations/users/new", :via => :post, :to => "users/registrations#create_next_new_user", :as => "create_next_new_user"
    match "organizations/users", :via => :get, :to => "users/registrations#index", :as => "users"
  end

  match "organizations", :via => :get, :to => "organizations#edit", :as => "organizations_edit"
  match "organizations", :via => :put, :to => "organizations#update", :as => "organizations_update"


  match "organizations/organization_infos", :via => :get, :to => "organization_infos#edit", :as => "edit_organization_infos"
  match "organizations/organization_infos", :via => :put, :to => "organization_infos#update", :as => "organization_infos"

  match "organizations/homepage", :via => :get, :to => "homepages#preview"

  match "organizations/view_design", :via => :get, :to => "view_designs#edit", :as => "view_designs"
  match "organizations/view_design", :via => :put, :to => "view_designs#update", :as => "view_designs"

  match "organizations/image", :via => :get, :to => "images#edit"
  match "organizations/image", :via => :put, :to => "images#update", :as => "images"

  root :to => "organizations#show"
end
