class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(resource_or_scope)
    dashboard_path
  end
  
  private
  def load_github_from_session
    @github = Github.new(githubber_session[:github_url])
  end
end
