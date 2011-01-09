Railstemplates::Application.routes.draw do

  devise_for :githubbers

  authenticate :githubber do

    resources :templates, :except => [:index, :show] do
      resources :likes, :only => [:create, :destroy]
      resources :works, :only => :create
      resources :commentaries, :only => :create
    end
    resources :gists, :only => [:new, :create]
    resources :repos, :only => [:new, :create]

    get '/dashboard' => "pages#dashboard", :as => :dashboard

  end

  resources :templates, :only => [:show, :index]
  get "/d/:id", :to => "templates#download", :as => :download
  resource :search, :only => :show

  get '/learn', :to => "pages#learn", :as => :learn
  get '/404', :to => "pages#error_404", :as => :error_404
  get '/500', :to => "pages#error_500", :as => :error_404
  get '/*fallback', :to => "pages#error_404"

  root :to => "pages#index"
end
