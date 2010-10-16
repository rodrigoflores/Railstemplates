class TemplatesController < ApplicationController
  respond_to :html
  before_filter :authenticate_githubber!, :except => [:show, :download]
  
  def like
    @template = Template.find(params[:id])
    if current_githubber.like(@template)
      render :json => @template
    else
      render :json => @template.errors, :status => 406
    end
  end

  def show
    @template = Template.find(params[:id])
    respond_with(@template)
  end

  def download
    @template = Template.find(params[:id])
    send_data @template.download!
  end

  def new
    @template = Template.new
    respond_with(@template)
  end

  def create
    @github = Github.new(params[:github_url])
    if @github.invalid?
      #TODO: Set flash message
      redirect_to new_template_path 
      return
    end
    
    githubber_session[:github_url] = @github.original_url
    
    if @github.gist?
      redirect_to new_gist_path
    else
      redirect_to new_repo_path
    end
  end

  def destroy
    @template = current_githubber.templates.find(params[:id])
    @template.destroy

    respond_to do |format|
      # TODO: Redirects to the user dashboard
      format.html { redirect_to(templates_url) }
    end
  end
  
end
