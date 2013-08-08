Minicms::Application.routes.draw do
   
  resources :organizations, :except => [:destroy] do
    resources :organization_infos, :except => [:destroy]
    resources :view_design, :except => [:destroy]
    resources :settings, :except => [:destroy]
  end

end
