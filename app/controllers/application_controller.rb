class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(resource_or_scope)
    dashboard_path
  end

  def rescue_action_in_public(exception)
    case exception
      when ActiveRecord::RecordNotFound, ActionController::UnknownController, 
        ActionController::UnknownAction, ActionController::RoutingError
        render :template => "pages/404", :status => 404
      else
        super
    end
  end
  
  def local_request?
    false
  end
  
  private
  def load_github_from_session
    @github = Github.new(githubber_session[:github_url])
  end
end
