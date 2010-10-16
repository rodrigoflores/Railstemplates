class LikesController < ApplicationController
  before_filter :authenticate_githubber!

  def create
    @template = Template.find(params[:template_id])
    if current_githubber.work(@template, params[:work])
      render :json => @template
    else
      render :json => @template.errors, :status => 406
    end
  end

end