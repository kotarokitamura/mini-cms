Minicms::Application.routes.draw do
   
  resources :organizations 

  match "organizations/:organization_id/organization_infos", :via => :get, :to => "organization_infos#edit", :as => "edit_organization_infos" 
  match "organizations/:organization_id/organization_infos", :via => :put, :to => "organization_infos#update", :as => "organization_infos" 

  match "organizations/:organization_id/homepage", :via => :get, :to => "homepages#preview"

  match "organizations/:organization_id/view_design", :via => :get, :to => "view_designs#edit", :as => "view_designs"
  match "organizations/:organization_id/view_design", :via => :put, :to => "view_designs#update", :as => "view_designs"
  
  match "organizations/:organization_id/image", :via => :get, :to => "images#edit" 
  match "organizations/:organization_id/image", :via => :put, :to => "images#update", :as => "images"

  root :to => "organizations#index"
end
