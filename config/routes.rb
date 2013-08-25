Minicms::Application.routes.draw do
   
  resources :organizations 
  match "organizations/:organization_id/organization_infos/new", :via => :get, :to => "organization_infos#new", :as => "new_organization_infos" 
  match "organizations/:organization_id/organization_infos/edit", :via => :get, :to => "organization_infos#edit", :as => "edit_organization_infos" 
  match "organizations/:organization_id/organization_infos", :via => :get, :to => "organization_infos#show", :as => "show_organization_infos" 
  match "organizations/:organization_id/organization_infos", :via => :post, :to => "organization_infos#create", :as => "organization_infos" 
  match "organizations/:organization_id/organization_infos", :via => :put, :to => "organization_infos#update", :as => "organization_infos" 
 
  match "organizations/:organization_id/organization_infos/:id", :via => :delete, :to => "organization_infos#destroy_organization_info" 
 
  match "organizations/:organization_id/stores/:id", :via => :delete, :to => "organization_infos#destroy_store" 
  
end
