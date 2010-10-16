Railstemplates::Application.routes.draw do

  authenticate :githubber do

    resources :templates, :only => [:new, :create, :show] do
      put :like, :on => :member
    end
    resources :gists, :only => [:new, :create]
    resources :repos, :only => [:new, :create]
    
    get '/dashboard' => "pages#dashboard", :as => :dashboard
  end

  devise_for :githubbers
  
  match 'search/', :controller => 'searches', :action => 'search'
  root :to => "pages#index"
end
