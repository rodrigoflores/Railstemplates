class TemplatesController < ApplicationController
  respond_to :html

  def show
    @template = Template.find(params[:id])
    respond_with(@template)
  end

  def new
    @template = Template.new
    respond_with(@template)
  end

  def create
    @github = Github.new(params[:github_url])
    redirect_to new_template_path if @github.invalid?
    
    githubber_session[:github_url] = @github.original_url
    
    if @github.gist?
      redirect_to new_gist_path
    else
      redirect_to new_repo_path
    end
  end

  def destroy
    @template = Template.find(params[:id])
    @template.destroy

    respond_to do |format|
      format.html { redirect_to(templates_url) }
    end
  end
  
end
