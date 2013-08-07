Minicms::Application.routes.draw do
   
  #basic organization informations
  resources :organizations, :except => [:destroy]
  # # # # # # # # # # # 
  #  organizations GET    /organizations(.:format)          organizations#index
  #                POST   /organizations(.:format)          organizations#create
  #  new_organization GET    /organizations/new(.:format)      organizations#new
  #  edit_organization GET    /organizations/:id/edit(.:format) organizations#edit
  #  organization GET    /organizations/:id(.:format)      organizations#show
  #                PUT    /organizations/:id(.:format)      organizations#update
  # # # # # # # # # # #
  
  #detail organization informations
  match 'organizations/:id/informations/new', :to => "organization_informations#new", :via => :get
  match 'organizations/:id/informations/edit', :to => "organization_informations#edit", :via => :get
  match 'organizations/:id/informations', :to => "organization_informations#show", :via => :get
  match 'organizations/:id/informations', :to => "organization_informations#create", :via => :post
  match 'organizations/:id/informations', :to => "organization_informations#update", :via => :put
  # # # # # # # # # # #
  #  GET  /organizations/:id/informations/new(.:format) organization_informations#new
  #  GET  /organizations/:id/informations(.:format)     organization_informations#show
  #  POST /organizations/:id/informations(.:format)     organization_informations#create
  #  PUT  /organizations/:id/informations(.:format)      organization_informations#update
  # # # # # # # # # # #

end
