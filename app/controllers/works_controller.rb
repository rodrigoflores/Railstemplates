class WorksController < ApplicationController
  before_filter :authenticate_githubber!

  def create
    template = Template.find(params[:template_id])
    vote = current_githubber.vote template, params[:work].present?
    if vote.persisted?
      render :json => template.stats
    else
      render :json => {}, :status => 406
    end
  end

end