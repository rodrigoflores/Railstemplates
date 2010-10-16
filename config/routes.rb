Railstemplates::Application.routes.draw do

  authenticate :githubber do
    resources :templates, :except => [:edit, :update]
    get '/dashboard' => "pages#dashboard", :as => :dashboard
  end

  devise_for :githubbers
  
  match 'search/', :controller => 'searches', :action => 'search'
  root :to => "pages#index"
end
