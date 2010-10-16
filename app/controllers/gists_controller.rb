class GistsController < ApplicationController
  include TemplateCreator
  before_filter :authenticate_githubber!, :load_github_from_session
  before_filter :set_github_path, :only => :create
  
  private
  def set_github_path
    params[:template][:gist_file] = "#{@github.original_url}/#{params[:template][:gist_file]}" rescue nil
  end
end
