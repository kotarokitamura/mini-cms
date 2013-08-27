Minicms::Application.routes.draw do
   
  resources :organizations 
  match "organizations/:organization_id/organization_infos", :via => :get, :to => "organization_infos#edit", :as => "edit_organization_infos" 
  match "organizations/:organization_id/organization_infos", :via => :put, :to => "organization_infos#update", :as => "organization_infos" 

  match "organizations/:id/homepage", :via => :get, :to => "homepages#show"
end
