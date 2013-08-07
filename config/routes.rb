Minicms::Application.routes.draw do
   
  #basic organization informations
  resources :organizations, :except => [:destroy]
  
  #detail organization informations
  match 'organizations/:id/informations/new', :to => "organization_informations#new", :via => :get
  match 'organizations/:id/informations/edit', :to => "organization_informations#edit", :via => :get
  match 'organizations/:id/informations', :to => "organization_informations#show", :via => :get
  match 'organizations/:id/informations', :to => "organization_informations#create", :via => :post
  match 'organizations/:id/informations', :to => "organization_informations#update", :via => :put

  #view design of each organization
  match 'organizations/:id/view_design/new', :to => "view_design#new", :via => :get
  match 'organizations/:id/view_design/edit', :to => "view_design#edit", :via => :get
  match 'organizations/:id/view_design', :to => "view_design#show", :via => :get
  match 'organizations/:id/view_design', :to => "view_design#create", :via => :post
  match 'organizations/:id/view_design', :to => "view_design#update", :via => :put
 
  #settings of ehach organization homepage
  match 'organizations/:id/settings/new', :to => "settings#new", :via => :get
  match 'organizations/:id/settings/edit', :to => "settings#edit", :via => :get
  match 'organizations/:id/settings', :to => "settings#show", :via => :get
  match 'organizations/:id/settings', :to => "settings#create", :via => :post
  match 'organizations/:id/settings', :to => "settings#update", :via => :put

end
