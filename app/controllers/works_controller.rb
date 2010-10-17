class WorksController < ApplicationController
  before_filter :authenticate_githubber!

  def create
    template = Template.find(params[:template_id])
    vote = current_githubber.vote template, params[:work].present?
    if vote.persisted?
      render :json => [template.stats[:working].last.to_i, template.stats[:not_working].last.to_i]
    else
      render :json => {}, :status => 406
    end
  end

end