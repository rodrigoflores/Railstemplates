class ReposController < ApplicationController
  before_filter :load_github_from_session
  before_filter :set_github_path, :only => :create
  include TemplateCreator
  
  private
  def set_github_path
    params[:template][:gist_file] = @github.raw_url rescue nil
  end
end
