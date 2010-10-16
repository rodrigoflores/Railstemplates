Railstemplates::Application.routes.draw do

  authenticate :githubber do
    
    resources :templates, :except => [:index] do
      resources :likes, :only => :create
    end
    resources :gists, :only => [:new, :create]
    resources :repos, :only => [:new, :create]
    
    get '/dashboard' => "pages#dashboard", :as => :dashboard

    get '/mine', :to => "templates#index", :as => :mine_templates
  end

  get "/download/:id", :to => "templates#download", :as => :download

  devise_for :githubbers
  
  get "/search", :to => "searches#search", :as => :search
  root :to => "pages#index"
  
  constraints(DownloadConstraint) do
    match "/:id",  :to => "templates#download"
  end
end
