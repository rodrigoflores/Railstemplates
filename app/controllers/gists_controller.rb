class GistsController < ApplicationController
  
  before_filter :load_github_from_session

  def new
    @template = Template.new
  end

  def create
    @template = current_githubber.templates.new(params[:template])
    if @template.save
      redirect_to template_url(@template)
    else
      render 'new'
    end
  end

end
