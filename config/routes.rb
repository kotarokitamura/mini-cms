Minicms::Application.routes.draw do

  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }

  devise_scope :user do
    match "organizations/:id/users/new", :via => :get, :to => "users/registrations#next_new_user"
    match "organizations/:id/users/new", :via => :post, :to => "users/registrations#create_next_new_user", :as => "create_next_new_user"
    match "organizations/:id/users", :via => :get, :to => "users/registrations#index", :as => "users"
  end

  resources :organizations, :only => [:edit, :update, :edit_organization_infos, :preview, :edit_view_designs, :update_view_designs, :edit_images, :update_images] do
    member do
      get :edit_organization_infos
      put :update_organization_infos
      get :preview
      get :edit_view_designs
      put :update_view_designs
      get :edit_images
      put :update_images
    end
  end

  root :to => "homepages#show"
end
