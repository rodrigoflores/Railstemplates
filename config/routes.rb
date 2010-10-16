Railstemplates::Application.routes.draw do

  authenticate :githubber do

    resources :templates, :only => [:new, :create, :show] do
      put :like, :on => :member
    end
    resources :gists, :only => [:new, :create]
    resources :repos, :only => [:new, :create]
    
    get '/dashboard' => "pages#dashboard", :as => :dashboard
  end

  get "/download/:id", :to => "templates#download", :as => :download

  devise_for :githubbers
  
  get "/search", :to => "searches#search", :as => :search
  root :to => "pages#index"
end
