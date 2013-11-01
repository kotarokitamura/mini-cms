Minicms::Application.routes.draw do

  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }

  devise_scope :user do
    match "organizations/:id/users/new", :via => :get, :to => "users/registrations#next_new_user"
    match "organizations/:id/users/new", :via => :post, :to => "users/registrations#create_next_new_user", :as => "create_next_new_user"
    match "organizations/:id/users", :via => :get, :to => "users/registrations#index", :as => "users"
  end

  resources :organizations, :only => [:edit, :update, :edit_organization_infos] do
    member do
      get :edit_organization_infos
      put :update_organization_infos
    end
  end

  match "organizations/:id/homepage", :via => :get, :to => "homepages#preview", :as => "organizations_homepage"

  match "organizations/:id/view_design", :via => :get, :to => "view_designs#edit", :as => "view_designs"
  match "organizations/:id/view_design", :via => :put, :to => "view_designs#update", :as => "view_designs"

  match "organizations/:id/image", :via => :get, :to => "images#edit", :as => "organization_image"
  match "organizations/:id/image", :via => :put, :to => "images#update", :as => "images"

  root :to => "homepages#show"
end
