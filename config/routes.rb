Railstemplates::Application.routes.draw do

  devise_for :githubbers

  authenticate :githubber do
    
    resources :templates, :except => [:index, :show] do
      resources :likes, :only => :create
      resources :works, :only => :create
    end
    resources :gists, :only => [:new, :create]
    resources :repos, :only => [:new, :create]
    
    get '/dashboard' => "pages#dashboard", :as => :dashboard

  end

  resources :templates, :only => [:show, :index]
  get "/download/:id", :to => "templates#download", :as => :download

  get "/search", :to => "searches#search", :as => :search

  get '/learn', :to => "pages#learn", :as => :learn
  root :to => "pages#index"
  
  match "/:id",  :to => "templates#download", :constraints => DownloadConstraint.new
end
